class GetEqualSubstringsWithinBudget {
    func equalSubstring(_ s: String, _ t: String, _ maxCost: Int) -> Int {
        let n = s.count
        let cost = zip(s, t).map {
            abs(Int($0.asciiValue!) - Int($1.asciiValue!))
        }
        var result = 0
        var left = 0
        var cur = 0
        for right in 0..<n {
            cur += cost[right]
            while cur > maxCost {
                cur -= cost[left]
                left += 1
            }
            result = max(result, right - left + 1)
        }
        return result
    }
    
    func tests() {
        print(equalSubstring("abcd", "bcdf", 3)) // 3
        print(equalSubstring("abcd", "cdef", 3)) // 1
        print(equalSubstring("abcd", "acde", 0)) // 1
        print(equalSubstring("abcd", "bcde", 0)) // 0
        print(equalSubstring("krpgjbjjznpzdfy", "nxargkbydxmsgby", 14)) // 4
    }
}

