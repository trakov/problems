class FindTheDifference {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var result: UInt8 = 0
        for c in s + t {
            result ^= c.asciiValue!
        }
        return Character(UnicodeScalar(result))
    }

    func findTheDifference1(_ s: String, _ t: String) -> Character {
        var map: [Character: Int] = [:]
        for c in t {
            map[c, default: 0] += 1
        }
        for c in s {
            map[c]! -= 1
            if map[c]! == 0 {
                map[c] = nil
            }
        }
        return map.first!.key
    }
    
    func findTheDifference2(_ s: String, _ t: String) -> Character {
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
