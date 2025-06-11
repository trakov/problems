final class MaximumDifferenceBetweenEvenandOddFrequencyII {
    func maxDifference(_ s: String, _ k: Int) -> Int {
        func getStatus(_ a: Int, _ b: Int) -> Int {
            return ((a & 1) << 1) | (b & 1)
        }
        let n = s.count
        var result = Int.min
        let s = Array(s)
        for a in "01234" {
            for b in "01234" where a != b {
                var best = Array(repeating: Int.max, count: 4)
                var (cnt_a, cnt_b) = (0, 0)
                var (prev_a, prev_b) = (0, 0)
                var left = -1
                for right in 0..<n {
                    cnt_a += s[right] == a ? 1 : 0
                    cnt_b += s[right] == b ? 1 : 0
                    while right - left >= k && cnt_b - prev_b >= 2 {
                        let left_status = getStatus(prev_a, prev_b)
                        best[left_status] = min(
                            best[left_status],
                            prev_a - prev_b
                        )
                        left += 1
                        prev_a += s[left] == a ? 1 : 0
                        prev_b += s[left] == b ? 1 : 0
                    }
                    let right_status = getStatus(cnt_a, cnt_b)
                    if best[right_status ^ 0b10] != Int.max {
                        result = max(
                            result,
                            cnt_a - cnt_b - best[right_status ^ 0b10]
                        )
                    }
                }
            }
        }
        return result
    }

    func tests() {
        print(maxDifference("12233", 4)) // -1
        print(maxDifference("1122211", 3)) // 1
        print(maxDifference("110", 3)) // -1
    }
}
