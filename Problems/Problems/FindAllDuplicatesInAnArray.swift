class FindAllDuplicatesInAnArray {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var nums = nums
        var result: [Int] = []
        for i in 0..<n {
            if nums[abs(nums[i]) - 1] < 0 {
                result.append(abs(nums[i]))
                continue
            }
            nums[abs(nums[i]) - 1] *= -1
        }
        return result
    }
    
    func findDuplicates2(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var nums = nums
        var i = 0
        while i < n {
            let pos = nums[i] - 1
            if nums[pos] != nums[i] {
                (nums[pos], nums[i]) = (nums[i], nums[pos])
            } else {
                i += 1
            }
        }
        var result: [Int] = []
        for i in 0..<n where i != nums[i] - 1 {
            result.append(nums[i])
        }
        return result
    }
    
    func tests() {
        print(findDuplicates([4,3,2,7,8,2,3,1])) // [2,3]
        print(findDuplicates([1,1,2])) // [1]
        print(findDuplicates([1])) // []
    }
}

