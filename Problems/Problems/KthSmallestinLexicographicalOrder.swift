class KthSmallestinLexicographicalOrder {
    func findKthNumber(_ n: Int, _ k: Int) -> Int {
        guard n > 9 else { return k }
        guard k > 1 else { return 1 }
        func countSteps(_ prefix1: Int, _ prefix2: Int) -> Int {
            var steps = 0
            var prefix1 = prefix1
            var prefix2 = prefix2
            while prefix1 <= n {
                steps += min(n + 1, prefix2) - prefix1
                prefix1 *= 10
                prefix2 *= 10
            }
            return steps
        }
        var curr = 1
        var k = k - 1
        while k > 0 {
            let step = countSteps(curr, curr + 1)
            if step <= k {
                curr += 1
                k -= step
            } else {
                curr *= 10
                k -= 1
            }
        }
        return curr
    }

    func tests() {
        print(findKthNumber(13, 2)) // 10
        print(findKthNumber(1, 1)) // 1
    }
}

