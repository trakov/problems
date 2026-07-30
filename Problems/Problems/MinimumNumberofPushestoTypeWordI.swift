final class MinimumNumberofPushestoTypeWordI {
    func minimumPushes(_ word: String) -> Int {
        var n = word.count
        var level = 1
        var result = 0
        while n > 0 {
            let count = min(n, 8)
            result += count * level
            level += 1
            n -= count
        }
        return result
    }
    
    func tests() {
        print(minimumPushes("abcde")) // 5
        print(minimumPushes("xycdefghij")) // 12
    }
}
