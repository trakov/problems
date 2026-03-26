final class EqualSumGridPartitionI {
    func canPartitionGrid(_ grid: [[Int]]) -> Bool {
        let (n, m) = (grid.count, grid[0].count)
        var rows = Array(repeating: 0, count: n)
        var cols = Array(repeating: 0, count: m)
        for i in 0..<n {
            for j in 0..<m {
                rows[i] += grid[i][j]
                cols[j] += grid[i][j]
            }
        }
        func helper(_ nums: [Int]) -> Bool {
            guard nums.count > 1 else { return false }
            var (l, r) = (0, nums.count - 1)
            var (leftSum, rightSum) = (0, 0)
            while l <= r {
                if leftSum < rightSum {
                    leftSum += nums[l]
                    l += 1
                } else if leftSum > rightSum {
                    rightSum += nums[r]
                    r -= 1
                } else if l != r {
                    leftSum = nums[l]
                    l += 1
                    rightSum = nums[r]
                    r -= 1
                } else {
                    return false
                }
            }
            return leftSum == rightSum
        }
        return helper(rows) || helper(cols)
    }
    
    func tests() {
        print(canPartitionGrid([[1,4],[2,3]])) // true
        print(canPartitionGrid([[1,3],[2,4]])) // false
        print(canPartitionGrid([[28443],[33959]])) // false
        print(canPartitionGrid([[42047],[57775],[99822]])) // true
        print(canPartitionGrid([[100000,100000,100000],[100000,66005,100000]])) // false
    }
}
