class DesignBrowserHistory {
    private var urls: [String]
    private var currentIndex: Int = 0
    
    init(_ homepage: String) {
        urls = [homepage]
    }
    
    init() {
        urls = ["zero"]
    }
    
    func visit(_ url: String) {
        urls.removeLast(urls.count - currentIndex - 1)
        urls.append(url)
        currentIndex += 1
    }
    
    func back(_ steps: Int) -> String {
        currentIndex = max(currentIndex - steps, 0)
        return urls[currentIndex]
    }
    
    func forward(_ steps: Int) -> String {
        currentIndex = min(currentIndex + steps, urls.count - 1)
        return urls[currentIndex]
    }

    func tests() {
        visit("0")
        visit("1")
        visit("2")
        visit("3")
        visit("4")
        back(1)
        forward(2)
        visit("5")
        back(3)
        visit("2+")
        print(urls)
//        print(<#name#>) //
    }
}

