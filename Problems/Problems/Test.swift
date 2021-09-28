import UIKit

struct AmazingModel: Codable {
    let title: String
    var imageURL: String
}

protocol AmazingDataServiceProtocol { // все сервисы закрываются протоколом. Здесь название не удачное, но смысл такой
//    func changeReferrer(to newReferrer: String) // убрать в init
    func loadAmazingData(completion: @escaping (([AmazingModel]) -> Void))
}

class AmazingDataService {

    static let shared = AmazingDataService(host: "www.amazing.com")
    // синглтон чаще плохо, очень часто оказывается что одного инстанса достаточно
    // и это заставляет продумывать иерархию зависимостей, чем вставлять синглтон куда попало

    private let host: String
    private var referrer: String!
    private let decodeQueue: DispatchQueue = DispatchQueue(
        // конкретно здесь данных очень мало, и не стоит декодинг делать в отдельной очереди,
        // больше потерь будет на переключении
        label: "AmazingDataService.DecodeQueue",
        qos: .background,
        attributes: .concurrent
    )

    // я бы сюда referrer прокинул, написал об этом ниже
    // host также должен быть скрыт в месте использования
    init(host: String) {
        self.host = host
    }
}

extension AmazingDataService: AmazingDataServiceProtocol {
    func changeReferrer(to newReferrer: String) {
        Self.shared.referrer = newReferrer // self is redundant
    }

    func loadAmazingData(completion: @escaping (([AmazingModel]) -> Void)) {
        var result: [AmazingModel] = []
        let group = DispatchGroup()
        group.enter() // а где group.leave() ?
        // клепание урлов - отдельно, в константы
        URLSession.shared.dataTask(with: URL(string: host + "/firstPartOfAmazing?referrer=(referrer)")!) { data, _, _ in
            guard let data = data else { completion([]); return }
            self.decodeQueue.async {
                let jsonDecoder = JSONDecoder()
                // по многим причинам может прийти нечто не то, надо обрабатывать, а не падать
                // если правильно понял что картинка и текст приходят отдельно, то падать будет всегда
                // если так, то ждем пока получим текст и картинку, и инициализируем AmazingModel
                let firstResult = try! jsonDecoder.decode([AmazingModel].self, from: data)
                result.append(contentsOf: firstResult)
            }
        }.resume()
        group.enter()
        URLSession.shared.dataTask(with: URL(string: host + "/secondPartOfAmazing?referrer=(referrer)")!) { data, _, _ in
            guard let data = data else { completion([]); return }
            self.decodeQueue.async {
                let jsonDecoder = JSONDecoder()
                let secondResult = try! jsonDecoder.decode([AmazingModel].self, from: data)
                result.append(contentsOf: secondResult)
            }
        }.resume()


        group.wait() // кажется, будет бесконечно ждать

        DispatchQueue.concurrentPerform(iterations: result.count) { index in
            var sizedModel = result[index]
            sizedModel.imageURL += "&size=300x300" // логичнее это добавлять там, где используется
            // и тогда - let imageURL (вместо var)
            result[index] = sizedModel
        }

        completion(result)
    }
}

class AmazingCell: UITableViewCell {

    @IBOutlet var amazingImageView: UIImageView! // все аутлеты должны быть private

    override func layoutSubviews() {
        makeImageViewAmazing()
    }

    func configure(with model: AmazingModel) {
        // загрузка данных не должна происходить в ячейке, она только отображает данные
        // также здесь при скроллинге загруженная картинка и текст будет подставлена не той ячейке
        // форс-анврап плохо. Когда критично, то лучше краш типа fataError("Не смог загрузить картинку")
        // Но здесь можно использовать плэйсхолдер для картинки и если урла нет, то не загружать картинку
        // guard let url = URL(string: model.imageURL) else { return }
        URLSession.shared.dataTask(with: URL(string: model.imageURL)!) { data, _, _ in
            guard let unwrappedData = data else { return }
            self.textLabel?.text = model.title
            self.amazingImageView.image = UIImage(data: unwrappedData)
        }
    }

    private func makeImageViewAmazing() {
        // у нас на проекте это правило - приватные методы - в приватный экстеншен
        // сделать UIView изумительной приходится частенько, можно сделать экстеншен для этого
        amazingImageView.layer.cornerRadius = amazingImageView.frame.height / 2
    }
}

class AmazingListViewController: UIViewController {

    @IBOutlet private var tableView: UITableView! // private
    private var amazingData: [AmazingModel] = [] // private

    let service: AmazingDataServiceProtocol = AmazingDataService.shared // все зависимости выносятся в проперти класса
    // название service - чересчур общее, amazingDataService - пойдет
    // 1. если есть DI, то инжектить service в конфиге, и проперти публичное
    // 2. иначе - приватное. Можно добавить фабрику для инициализации сервиса, чтобы здесь не было конкретного типа
    // 3. можно прокинуть в инициализацию тип экрана, в фабрику, в которой хранится соответствие типа экрана и referrer
    // в любом случае объект помечается как протокол вместо конкретного типа
    
    override func viewDidLoad() {
        // надо зарегистрировать ячейки для таблицы
        // удостовериться что проставлен dataSource для таблицы
        super.viewDidLoad()
        loadData()
    }

    internal func loadData() {
//        service.changeReferrer(to: "amazing.list") // убрать в init
        service.loadAmazingData { amazingData in // [weak self]
            self.amazingData = amazingData
            if amazingData.count == 0 {
                // мне больше нравится выносить текста в константы и в коде уже использовать понятную константу
                // private struct Texts {
                //     static let errorMessage = "amazing.data.load.error".localized
                // }
                self.showError("amazing.data.load.error".localized)
            } else {
                self.tableView.reloadData()
            }
        }
    }
}

extension AmazingListViewController: UITableViewDataSource {
// у нас на проекте правило - бьём на экстеншены. Да, бывает чуть менее эффективно (пруфов я не видел..),
// но читабельность кода также важна
    func numberOfSections(in tableView: UITableView) -> Int {
        // magic number = плохо, непонятно откуда берется
        // как минимум вынести в константы.
        // может вместо HeaderCell сделать хидер таблицы?
        // в этом случае этот метод можно опустить
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return amazingData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // почитать про reusable ячейки
        if indexPath.section == 0 {
            return HeaderCell()
        } else {
            let cell = AmazingCell()
            let model = amazingData[indexPath.row]
            cell.configure(with: model)
            return cell
        }
    }
}

// MARK: - Все что ниже это вспомогательный код 🙃 тут проблемы искать не нужно

extension AmazingListViewController {
    private func showError(_ errorMessage: String) {
        let alertController = UIAlertController(title: "Error".localized, message: errorMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
}

class HeaderCell: UITableViewCell { }

extension String {
    var localized: String { return self }
}
