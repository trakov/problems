class CheckIfOneStringSwapCanMakeStringsEqual {
    func areAlmostEqual(_ s1: String, _ s2: String) -> Bool {
        guard s1.count == s2.count else { return false }
        if s1 == s2 { return true }
        var s1 = Array(s1)
        var s2 = Array(s2)
        var i = 0
        var firstIndex: Int?
        while i < s1.count {
            if s1[i] != s2[i] {
                if firstIndex == nil {
                    firstIndex = i
                } else {
                    s1.swapAt(firstIndex!, i)
                    return s1 == s2
                }
            }
            i += 1
        }
        return false
    }

    func tests() {
        print(areAlmostEqual("bank", "kanb")) // true
        print(areAlmostEqual("attack", "defend")) // false
        print(areAlmostEqual("kelb", "kelb")) // true
    }
}
