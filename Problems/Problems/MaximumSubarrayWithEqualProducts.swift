final class MaximumSubarrayWithEqualProducts {
    func maxLength(_ nums: [Int]) -> Int {
        func gcd(_ num1: Int, _ num2: Int) -> Int {
            if num2 == 0 { return num1 }
            return gcd(num2, num1 % num2)
        }
        var result = 2
        var prodVal = 1
        let n = nums.count
        var (start, end) = (0, 0)
        while end < n {
            while gcd(prodVal, nums[end]) > 1 {
                prodVal /= nums[start]
                start += 1
            }
            prodVal *= nums[end]
            result = max(result, end - start + 1)
            end += 1
        }
        return result
    }

    func tests() {
        print(maxLength([1,2,1,2,1,1,1])) // 5
        print(maxLength([2,3,4,5,6])) // 3
        print(maxLength([1,2,3,1,4,5,1])) // 5
    }
}
