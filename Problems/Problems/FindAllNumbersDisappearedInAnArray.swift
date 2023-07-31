class FindAllNumbersDisappearedInAnArray {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var nums = nums
        var i = 0
        while i < n {
            let pos = nums[i] - 1
            if nums[i] != nums[pos] {
                (nums[i], nums[pos]) = (nums[pos], nums[i])
            } else {
                i += 1
            }
        }
        
        var result: [Int] = []
        for i in 0..<n {
            if nums[i] != i + 1 {
                result.append(i + 1)
            }
        }
        return result
    }
    
    func findDisappearedNumbers2(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty else { return [] }
        guard nums.count > 1 else { return nums[0] == 1 ? [] : [1] }
        let nums = nums.sorted()
        var result: [Int] = []
        var lastNum = 0
        for n in nums {
            if n - lastNum > 1 {
                result.append(contentsOf: ((lastNum + 1)...(n - 1)))
            }
            lastNum = n
        }
        if nums.count - lastNum > 0 {
            result.append(contentsOf: ((lastNum + 1)...nums.count))
        }
        return result
    }

    func setSolution(_ nums: [Int]) -> [Int] {
        let numbers = Set(1...nums.count)
        return Array(numbers.subtracting(nums))
    }
    
    func tests() {
        print(findDisappearedNumbers([4,3,2,7,8,2,3,1])) // [5,6]
        print(findDisappearedNumbers([1,1])) // [2]
        print(findDisappearedNumbers([1,1,1,1])) // [2,3,4]
    }
}
