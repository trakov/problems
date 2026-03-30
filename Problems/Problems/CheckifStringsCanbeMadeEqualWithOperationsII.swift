final class CheckifStringsCanbeMadeEqualWithOperationsII {
    func checkStrings(_ s1: String, _ s2: String) -> Bool {
        var even: [Character: Int] = [:]
        var odd: [Character: Int] = [:]
        for (i, (c1, c2)) in zip(s1, s2).enumerated() {
            if i % 2 == 0 {
                even[c1, default: 0] += 1
                even[c2, default: 0] -= 1
            } else {
                odd[c1, default: 0] += 1
                odd[c2, default: 0] -= 1
            }
        }
        return Set(even.values).union(odd.values).count == 1
    }
    
    func tests() {
        print(checkStrings("c", "c")) // true
        print(checkStrings("abcdba", "cabdab")) // true
        print(checkStrings("abe", "bea")) // false
    }
}
