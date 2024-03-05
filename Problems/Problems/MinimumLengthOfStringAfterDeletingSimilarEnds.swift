class MinimumLengthOfStringAfterDeletingSimilarEnds {
    func minimumLength(_ s: String) -> Int {
        let s = Array(s)
        var l = 0
        var r = s.count - 1
        while l < r {
            guard s[l] == s[r] else { break }
            repeat {
                l += 1
            } while l < r && s[l] == s[l - 1]
            repeat {
                r -= 1
            } while l < r && s[r] == s[r + 1]
        }
        return max(r - l + 1, 0)
    }
    
    func tests() {
        print(minimumLength("ca")) // 2
        print(minimumLength("cabaabac")) // 0
        print(minimumLength("aabccabba")) // 3
    }
}

