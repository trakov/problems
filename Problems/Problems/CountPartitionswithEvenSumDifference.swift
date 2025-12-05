final class CountPartitionswithEvenSumDifference {
    func countPartitions(_ nums: [Int]) -> Int {
        nums.reduce(0, +) % 2 == 0 ? nums.count - 1 : 0
    }
    
    func tests() {
        print(countPartitions([10,10,3,7,6])) // 4
        print(countPartitions([1,2,2])) // 0
        print(countPartitions([2,4,6,8])) // 3
    }
}
