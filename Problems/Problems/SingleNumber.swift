class SingleNumber {
    func singleNumber(_ nums: [Int]) -> Int {
        nums.reduce(0, ^)
//        var result = 0
//        nums.forEach {
//            result = result ^ $0
//        }
//        return result

//        guard nums.count > 1 else { return nums.first! }
//        var numbers: [Int: Int] = [:]
//        for num in nums {
//            if numbers[num] != nil {
//                numbers[num] = nil
//            } else {
//                numbers[num] = 1
//            }
//        }
//        return numbers.first!.key
    }
    
    func tests() {
        print(singleNumber([2,2,1])) // 1
        print(singleNumber([4,1,2,1,2])) // 4
        print(singleNumber([1])) // 1
    }
}
