class NumberOfWaysToReorderArrayToGetSameBST {
    func numOfWays(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n > 2 else { return 0 }
        
        let mod = 1_000_000_007
        var triangle = Array(repeating: Array(repeating: 0, count: n), count: n)
        for i in 0..<n {
            triangle[i][0] = 1
            triangle[i][i] = 1
        }
        for i in 2..<n {
            for j in 1..<i {
                triangle[i][j] = (triangle[i - 1][j] + triangle[i - 1][j - 1]) % mod
            }
        }

        func dfs(_ nums: [Int]) -> Int {
            guard nums.count > 2 else { return 1 }
            let root = nums[0]
            var left: [Int] = []
            var right: [Int] = []
            for n in nums {
                if n < root {
                    left.append(n)
                } else if n > root {
                    right.append(n)
                }
            }
            return (triangle[left.count + right.count][left.count] * (dfs(left) % mod) % mod) * dfs(right) % mod
        }
        
        return dfs(nums) - 1
    }
    
    func tests() {
        print(numOfWays([1])) // 0
        print(numOfWays([2,1,3])) // 1
        print(numOfWays([3,4,5,1,2])) // 5
        print(numOfWays([1,2,3])) // 0
    }
}

