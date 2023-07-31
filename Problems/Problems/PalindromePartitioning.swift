class PalindromePartitioning {
    func partition(_ s: String) -> [[String]] {
        guard s.count > 1 else { return [[s]] }
        var result: [[String]] = []
        let s = Array(s)
        func dfs(start: Int, currentList: [String]) {
            if start >= s.count {
                result.append(currentList)
            }
            var currentList = currentList
            for end in start..<s.count {
                if (isPalindrome(s: s, low: start, high: end)) {
                    currentList.append(String(s[start..<end+1]))
                    dfs(start: end + 1, currentList: currentList)
                    currentList.removeLast()
                }
            }
        }

        func isPalindrome(s: Array<Character>, low: Int, high: Int) -> Bool {
            var low = low
            var high = high
            while low < high {
                guard s[low] == s[high] else { return false }
                low += 1
                high -= 1
            }
            return true
        }

        dfs(start: 0, currentList: [String]())
        
        return result
    }

    func tests() {
        print(partition("aab")) // [["a","a","b"],["aa","b"]]
        print(partition("a")) // [["a"]]
    }
}
