class MinimumNumberofPushestoTypeWordII {
    func minimumPushes(_ word: String) -> Int {
        var map: [Character: Int] = [:]
        for c in word {
            map[c, default: 0] += 1
        }
        guard map.count > 8 else { return word.count }
        var pushes = 0
        let count = map.values.sorted(by: >)
        for (i, c) in count.enumerated() {
            pushes += (i / 8 + 1) * c
        }
        return pushes
    }
    
    func tests() {
        print(minimumPushes("abcde")) // 5
        print(minimumPushes("xyzxyzxyzxyz")) // 12
        print(minimumPushes("aabbccddeeffgghhiiiiii")) // 24
    }
}

