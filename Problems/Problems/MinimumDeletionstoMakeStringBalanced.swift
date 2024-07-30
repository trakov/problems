class MinimumDeletionstoMakeStringBalanced {
    func minimumDeletions(_ s: String) -> Int {
        let n = s.count
        var bLeft = 0
        var aRight = 0
        for c in s where c == "a" { aRight += 1 }
        guard aRight > 0 && aRight < n - 1 else { return 0 }
        var result = n
        for c in s {
            if c == "a" {
                aRight -= 1
                result = min(result, bLeft + aRight)
            } else {
                result = min(result, bLeft + aRight)
                bLeft += 1
            }
        }
        return result
    }

    func tests() {
        print(minimumDeletions("aababbab")) // 2
        print(minimumDeletions("bbaaaaabb")) // 2
        print(minimumDeletions("bbbbbbbaabbbbbaaabbbabbbbaabbbbbbaabbaaabaabbbaaaabaaababbbabbabbaaaabbbabbbbbaabbababbbaaaaaababaaababaabbabbbaaaabbbbbabbabaaaabbbaba")) // 60
    }
}

