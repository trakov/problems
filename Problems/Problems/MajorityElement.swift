class MajorityElement {
    func majorityElement(_ nums: [Int]) -> Int {
        guard var result = nums.first else { return 0 }
        var frequency = 1
        for num in nums.dropFirst() {
            if result == num {
                frequency += 1
            } else {
                frequency -= 1
            }
            if frequency == 0 {
                result = num
                frequency = 1
            }
        }
        return result
    }
    
    func tests() {
        print(majorityElement([8,8,7,7,7])) // 7
        print(majorityElement([1])) // 1
        print(majorityElement([3,2,3])) // 3
        print(majorityElement([2,2,1,1,1,2,2])) // 2
        print(majorityElement([2,1,2,1,2,1,2,1,2])) // 2
    }
}
