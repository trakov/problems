final class FindMinimumOperationstoMakeAllElementsDivisiblebyThree {
    func minimumOperations(_ nums: [Int]) -> Int {
        nums.reduce(0) { $0 + ($1 % 3 == 0 ? 0 : 1) }
    }
    
    func tests() {
        print(minimumOperations([1,2,3,4])) // 3
        print(minimumOperations([3,6,9])) // 0
    }
}
