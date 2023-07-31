class NumberOfZeroFilledSubarrays {
    func zeroFilledSubarray(_ nums: [Int]) -> Int {
        var result = 0
        var count = 0
        for num in nums {
            if num == 0 {
                count += 1
            } else {
                count = 0
            }
            result += count
        }
        return result
    }
    
    func tests() {
        print(zeroFilledSubarray([1,3,0,0,2,0,0,4])) // 6
        print(zeroFilledSubarray([0,0,0,2,0,0])) // 9
        print(zeroFilledSubarray([2,10,2019])) // 0
    }
}

