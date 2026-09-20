final class ReverseDegreeofaString {
    func reverseDegree(_ s: String) -> Int {
        func weight(_ c: Character) -> Int {
            26 - Int(c.asciiValue! - Character("a").asciiValue!)
        }
        return s.enumerated().reduce(0) {
            $0 + weight($1.element) * ($1.offset + 1)
        }
    }
    
    func tests() {
        print(reverseDegree("abc")) // 148
        print(reverseDegree("zaza")) // 160
    }
}
