class MajorityElementII {
    func majorityElement(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return nums }
        var map: [Int: Int] = [:] // num: count
        for num in nums {
            map[num, default: 0] += 1
        }
        var result: [Int] = []
        for (num, count) in map where count > nums.count / 3 {
            result.append(num)
        }
        return result
    }
    
    func tests() {
        print(majorityElement([3,2,3])) // [3]
        print(majorityElement([1])) // [1]
        print(majorityElement([1,2])) // [1,2]
    }
}

