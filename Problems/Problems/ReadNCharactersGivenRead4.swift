// https://www.youtube.com/watch?v=x7pg4cTHu4g
class ReadNCharactersGivenRead4 {
    final class Reader4 {
        func read(_ buf: [Character], _ n: Int) -> Int {
            return 0
        }
    }
    
    func tests() {
        let r = Reader4()
        print(r.read(Array("abcde"), 5)) // 5
    }
}

