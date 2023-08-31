class MinimumReplacementsToSortTheArray {
    func minimumReplacement(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n > 1 else { return 0 }
        var nums = nums
        var result = 0
        for i in (0..<n-1).reversed() {
            guard nums[i] > nums[i + 1] else { continue }
            let numElements = (nums[i] + nums[i + 1] - 1) / nums[i + 1]
            result += numElements - 1
            nums[i] = nums[i] / numElements
        }
        return result
    }
    
    func tests() {
        print(minimumReplacement([3,9,3])) // 2
        print(minimumReplacement([3,2,1])) // 3
        print(minimumReplacement([3,1,2])) // 2
        print(minimumReplacement([1,2,3,4,5])) // 0
    }
}

