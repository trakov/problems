final class NRepeatedElementinSize2NArray {
    func repeatedNTimes(_ nums: [Int]) -> Int {
        var set: Set<Int> = []
        for num in nums {
            guard set.insert(num).inserted else { return num }
        }
        return -1
    }
    
    func tests() {
        print(repeatedNTimes([1,2,3,3])) // 3
        print(repeatedNTimes([2,1,2,5,3,2])) // 2
        print(repeatedNTimes([5,1,5,2,5,3,5,4])) // 5
    }
}
