final class MinimumOperationstoMakeArraySumDivisiblebyK {
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        nums.reduce(0, +) % k
    }
    
    func tests() {
        print(minOperations([3,9,7], 5)) // 4
        print(minOperations([4,1,3], 4)) // 0
        print(minOperations([3,2], 6)) // 5
    }
}
