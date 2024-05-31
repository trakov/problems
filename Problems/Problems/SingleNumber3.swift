class SingleNumber3 {
    func singleNumber(_ nums: [Int]) -> [Int] {
        let xor = nums.reduce(0, ^)
        let rightmostSetBit = xor & -xor
        var a = 0
        for num in nums where num & rightmostSetBit == 0 {
            a ^= num
        }
        return [a, a ^ xor]
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
