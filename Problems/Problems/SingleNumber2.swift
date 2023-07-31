class SingleNumber2 {
    func singleNumber(_ nums: [Int]) -> Int {
        var ones = 0
        var twos = 0
        for num in nums {
            ones = ones ^ num & ~twos
            twos = twos ^ num & ~ones
        }
        return ones
    }
    
    func singleNumber2(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return nums.first! }
        var dict: [Int: Int] = [:]
        for num in nums {
            if dict[num] == 2 {
                dict[num] = nil
            } else {
                dict[num] = (dict[num] ?? 0) + 1
            }
        }
        return dict.first!.key
    }
    
    func tests() {
        print(singleNumber([2,2,3,2])) // 3
        print(singleNumber([0,1,0,1,0,1,99])) // 99
        print(singleNumber([1])) // 1
    }
}
