class MinimumCostToMakeArrayEqual {
    func minCost(_ nums: [Int], _ cost: [Int]) -> Int {
        var left = Int.max
        var right = 0
        for num in nums {
            left = min(left, num)
            right = max(right, num)
        }
        
        func calculateCost(_ num: Int) -> Int{
            var total = 0
            for (i,x) in nums.enumerated() {
                total += abs(num - x) * cost[i]
            }
            return total
        }

        var mid = (left + right) / 2
        while left < right {
            let x = calculateCost(mid)
            let y = calculateCost(mid + 1)
            if x < y {
                right = mid
            } else {
                left = mid + 1
            }
            mid = (left + right) / 2
        }
        return calculateCost(left)
    }

    func tests() {
        print(minCost([1,3,5,2], [2,3,1,14])) // 8
        print(minCost([2,2,2,2,2], [4,2,8,1,3])) // 0
    }
}
