final class PartitionArraySuchThatMaximumDifferenceIsK {
    func partitionArray(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums.sorted()
        var result = 1
        var first = nums[0]
        for num in nums.dropFirst() {
            if num - first > k {
                first = num
                result += 1
            }
        }
        return result
    }
    
    func tests() {
        print(partitionArray([3,6,1,2,5], 2)) // 2
        print(partitionArray([1,2,3], 1)) // 2
        print(partitionArray([2,2,4,5], 0)) // 3
        print(partitionArray([2], 3)) // 1
    }
}
