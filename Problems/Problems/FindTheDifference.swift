class FindTheDifference {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        let a = s + t
        let av = a.reduce(0) {
            $0 ^ $1.asciiValue!
        }
        return Character(UnicodeScalar(av))
    }
    
    func sort(_ s: String, _ t: String) -> Character {
        let a = s + t
        let av = a.reduce(0) {
            $0 ^ $1.asciiValue!
        }
        return Character(UnicodeScalar(av))

        guard t.count > 1 else { return t.first! }
        let sortedS = s.sorted()
        let sortedT = t.sorted()
        for i in 0..<sortedS.count {
            if sortedS[i] != sortedT[i] {
                return sortedT[i]
            }
        }
        return sortedT.last!
    }

    func tests() {
        print(findTheDifference("abcd", "abcde"))
        print(findTheDifference("", "y"))
    }
}
