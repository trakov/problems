class PredictTheWinner {
    func PredictTheWinner(_ nums: [Int]) -> Bool {
        let n = nums.count
        var memo = Array(repeating: Array(repeating: -1, count: n), count: n)
        func maxDiff(_ left: Int, _ right: Int) -> Int {
            guard memo[left][right] == -1 else { return memo[left][right] }
            guard left != right else { return nums[left] }
            let scoreByLeft = nums[left] - maxDiff(left + 1, right)
            let scoreByRight = nums[right] - maxDiff(left, right - 1)
            memo[left][right] = max(scoreByLeft, scoreByRight)
            return memo[left][right]
        }
        return maxDiff(0, n - 1) >= 0
    }
    
    func tests() {
        print(PredictTheWinner([1,5,2])) // false
        print(PredictTheWinner([1,5,233,7])) // true
    }
}

