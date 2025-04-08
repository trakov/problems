final class MinimumNumberofOperationstoMakeElementsinArrayDistinct {
    func minimumOperations(_ nums: [Int]) -> Int {
        var set: Set<Int> = []
        for num in nums.reversed() where !set.insert(num).inserted {
            break
        }
        return (nums.count - set.count + 2) / 3
    }
    
    func tests() {
        print(minimumOperations([1,2,3,4,2,3,3,5,7])) // 2
        print(minimumOperations([4,5,6,4,4])) // 2
        print(minimumOperations([6,7,8,9])) // 0
    }
}
