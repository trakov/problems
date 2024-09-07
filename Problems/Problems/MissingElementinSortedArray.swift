class MissingElementinSortedArray {
    // O(logn)
    func missingElement(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        guard n > 0 && k > 0 else { return 0 }
        var left = 0
        var right = n - 1

        while left < right {
            let mid = right - (right - left) / 2
            if nums[mid] - nums[0] < mid + k {
                left = mid
            } else {
                right = mid - 1
            }
        }
        return nums[0] + k + left
    }

    // O(n)
    func missingElement1(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var k = k
        for (i, num) in nums.enumerated().dropFirst() {
            let gap = num - nums[i - 1] - 1
            if gap >= k {
                return nums[i - 1] + k
            }
            k -= gap
        }
        return nums[n - 1] + k
    }
    
    func tests() {
        print(missingElement([4,7,9,10], 1)) // 5
        print(missingElement([4,7,9,10], 3)) // 8
        print(missingElement([1,2,4], 3)) // 6
    }
}

