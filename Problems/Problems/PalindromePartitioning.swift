class PalindromePartitioning {
    func partition(_ s: String) -> [[String]] {
        guard s.count > 1 else { return [[s]] }
        var result: [[String]] = []
        let s = Array(s)
        let n = s.count
        func dfs(_ start: Int, _ cur: [String]) {
            guard start < n else { return result.append(cur) }
            for end in start..<n where isPalindrome(start, end) {
                dfs(end + 1, cur + [String(s[start...end])])
            }
        }
        func isPalindrome(_ low: Int, _ high: Int) -> Bool {
            guard low < high else { return true }
            guard s[low] == s[high] else { return false }
            return isPalindrome(low+1, high-1)
        }
        dfs(0, [])
        return result
    }

    func tests() {
        print(partition("aab")) // [["a","a","b"],["aa","b"]]
        print(partition("a")) // [["a"]]
        print(partition("efe"))
    }
}
