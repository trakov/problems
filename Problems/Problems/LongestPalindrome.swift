class LongestPalindrome {
    func longestPalindrome(_ s: String) -> Int {
        guard s.count > 1 else { return 1 }
        var ss = s.sorted()
        var result = 0
        
        var prev = ss.removeFirst()
        var one = 0
        while !ss.isEmpty {
            let cur = ss.removeFirst()
            if prev == cur {
                result += 2
                if !ss.isEmpty {
                    prev = ss.removeFirst()
                    if ss.isEmpty {
                        one = 1
                    }
                }
            } else {
                prev = cur
                one = 1
            }
        }
        
        return result + one
    }

    func tests() {
        print(longestPalindrome("ccc")) // 3
        print(longestPalindrome("abccccdd")) // 7
        print(longestPalindrome("a")) // 1
    }
}
