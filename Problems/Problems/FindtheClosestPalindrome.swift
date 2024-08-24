class FindtheClosestPalindrome {
    func nearestPalindromic(_ n: String) -> String {
        let count = n.count
        guard count > 1 else {
            return n == "0" ? "1" : String(Int(n)! - 1)
        }
        let isEven = count % 2 == 0
        let first = Int(n.prefix(count / 2 + (isEven ? 0 : 1)))!
        
        func palindrome(_ half: Int) -> String {
            var res = String(half)
            var half = half
            if !isEven {
                half /= 10
            }
            while half > 0 {
                res.append(String(half % 10))
                half /= 10
            }
            return res
        }
        
        var candidates: [String] = []
        candidates.append(palindrome(first))
        candidates.append(palindrome(first - 1))
        candidates.append(palindrome(first + 1))
        candidates.append(String(repeating: "9", count: count - 1))
        candidates.append("1" + String(repeating: "0", count: count - 1) + "1")
        
        var result = ""
        var diff = Int.max
        for candidate in candidates {
            guard candidate != n else { continue }
            let curDiff = abs(Int(candidate)! - Int(n)!)
            if curDiff < diff {
                result = candidate
                diff = curDiff
            } else if diff == curDiff {
                if candidate.count < result.count {
                    result = candidate
                } else {
                    result = min(result, candidate)
                }
            }
        }
        return result
    }
    
    func tests() {
        print(nearestPalindromic("123")) // 121
        print(nearestPalindromic("1")) // 0
        print(nearestPalindromic("10")) // 9
    }
}

