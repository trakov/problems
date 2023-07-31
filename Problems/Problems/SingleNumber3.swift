class SingleNumber3 {
    func singleNumber(_ nums: [Int]) -> [Int] {
        let xor = nums.reduce(0, ^)
        let rightmostSetBit = xor & -xor
        var num1 = 0
        var num2 = 0
        // Step 5: Find the two elements that appear only once
        for num in nums {
            if num & rightmostSetBit != 0 {
                num1 ^= num
            } else {
                num2 ^= num
            }
        }
        // Step 7: Return the result
        return [num1, num2]
    }
    
    func singleNumber2(_ nums: [Int]) -> [Int] {
        guard nums.count > 2 else { return nums }
        var dict: [Int: Int] = [:]
        for num in nums {
            if dict[num] != nil {
                dict[num] = nil
            } else {
                dict[num] = 1
            }
        }
        return Array(dict.keys)
    }
    
    func tests() {
        print(singleNumber([1,2,1,3,2,5])) // [3, 5]
        print(singleNumber([1, 2])) // [1, 2]
    }
}
