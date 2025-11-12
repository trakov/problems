final class MinimumNumberofOperationstoMakeAllArrayElementsEqualto1 {
    func gcd(_ a: Int, _ b: Int) -> Int {
        var (a, b) = (a, b)
        while b != 0 {
            (a, b) = (b, a % b)
        }
        return a
    }

    func minOperations(_ nums: [Int]) -> Int {
        let n = nums.count
        var num1 = 0
        var g = 0
        for num in nums {
            if num == 1 {
                num1 += 1
            }
            g = gcd(g, num)
        }
        if num1 > 0 {
            return n - num1
        }
        if g > 1 {
            return -1
        }
        var minLen = n
        for i in 0..<n {
            var currentGcd = 0
            for j in i..<n {
                currentGcd = gcd(currentGcd, nums[j])
                if currentGcd == 1 {
                    minLen = min(minLen, j - i + 1)
                    break
                }
            }
        }
        return minLen + n - 2
    }

    func tests() {
        print(minOperations([2,6,3,4])) // 4
        print(minOperations([2,10,6,14])) // -1
    }
}
