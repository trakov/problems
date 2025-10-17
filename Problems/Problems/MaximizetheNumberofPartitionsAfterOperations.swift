final class MaximizetheNumberofPartitionsAfterOperations {
    func maxPartitionsAfterOperations(_ s: String, _ k: Int) -> Int {
        let n = s.count
        var left = Array(repeating: Array(repeating: 0, count: 3), count: n)
        var right = Array(repeating: Array(repeating: 0, count: 3), count: n)
        var num = 0
        var mask = 0
        var count = 0
        for (i, c) in s.enumerated().dropLast() {
            let binary = 1 << (c.asciiValue! - Character("a").asciiValue!)
            if (mask & binary) == 0 {
                count += 1
                if count <= k {
                    mask |= binary
                } else {
                    num += 1
                    mask = binary
                    count = 1
                }
            }
            left[i + 1] = [num, mask, count]
        }
        num = 0
        mask = 0
        count = 0
        for (i, c) in s.enumerated().dropFirst().reversed() {
            let binary = 1 << (c.asciiValue! - Character("a").asciiValue!)
            if (mask & binary) == 0 {
                count += 1
                if count <= k {
                    mask |= binary
                } else {
                    num += 1
                    mask = binary
                    count = 1
                }
            }
            right[i - 1] = [num, mask, count]
        }
        var maxVal = 0
        for i in 0..<n {
            var seg = left[i][0] + right[i][0] + 2
            let totMask = left[i][1] | right[i][1]
            let totCount = totMask.nonzeroBitCount
            if left[i][2] == k && right[i][2] == k && totCount < 26 {
                seg += 1
            } else if min(totCount + 1, 26) <= k {
                seg -= 1
            }
            maxVal = max(maxVal, seg)
        }
        return maxVal
    }
    
    func tests() {
        print(maxPartitionsAfterOperations("accca", 2)) // 3
        print(maxPartitionsAfterOperations("aabaab", 3)) // 1
        print(maxPartitionsAfterOperations("xxyz", 1)) // 4
    }
}
