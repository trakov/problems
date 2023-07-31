class NextGreaterElementII {
    func nextGreaterElements(_ nums: [Int]) -> [Int] {
        var result = Array(repeating: -1, count: nums.count)
        let n = nums.count
        var stack: [Int] = [] // indices
        for i in 0..<(n * 2) {
            while !stack.isEmpty && nums[stack.last!] < nums[i % n] {
                result[stack.last!] = nums[i % n]
                stack.removeLast()
            }
            stack.append(i % n)
        }
        return result
    }
    
    func nextGreaterElements2(_ nums: [Int]) -> [Int] {
        var stack: [Int] = [] // indices
        var result = Array(repeating: -1, count: nums.count)
        let n = nums.count
        for i in (0..<2*n).reversed() {
            while !stack.isEmpty && nums[i % n] >= nums[stack.last!] {
                stack.removeLast()
            }
            if !stack.isEmpty {
                result[i % n] = nums[stack.last!]
            }
            stack.append(i % n)
        }
        return result
    }
    
    func tests() {
        print(nextGreaterElements([1,2,1])) // [2,-1,2]
        print(nextGreaterElements([1,2,3,4,3])) // [2,3,4,-1,4]
        print(nextGreaterElements([5,4,3,2,1])) // [-1,5,5,5,5]
    }
}

