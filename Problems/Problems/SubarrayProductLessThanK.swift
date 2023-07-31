class SubarrayProductLessThanK {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        guard k > 1 else { return 0 }
        var result = 0
        var product = 1
        var left = 0
        for (i, num) in nums.enumerated() {
            product *= num
            while product >= k {
                product /= nums[left]
                left += 1
            }
            result += i - left + 1
        }
        return result
    }

    func numSubarrayProductLessThanK2(_ nums: [Int], _ k: Int) -> Int {
        guard k > 0 else { return 0 }
        var result = 0
        var product = 1
        for (i, num) in nums.enumerated() {
            guard num < k else { continue }
            result += 1
            product = num
            for j in (0..<i).reversed() {
                product *= nums[j]
                guard product < k else { break }
                result += 1
            }
        }
        
        return result
    }

    func tests() {
        print(numSubarrayProductLessThanK([10,5,2,6], 100)) // 8
        print(numSubarrayProductLessThanK([1,2,3], 0)) // 0
    }
}
