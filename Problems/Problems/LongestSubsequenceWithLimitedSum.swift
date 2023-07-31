class LongestSubsequenceWithLimitedSum {
    func answerQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
        let nums = nums.sorted()
        var sum = 0
        let sums = nums.map { num in
            sum += num
            return sum
        }
        var answers = Array(repeating: 0, count: queries.count)
        var left = 0
        var right = nums.count - 1
        var middle = 0
        for (i, maxSum) in queries.enumerated() {
            left = 0
            right = sums.count - 1
            while left <= right {
                middle = (left + right) / 2
                if sums[middle] <= maxSum {
                    left = middle + 1
                } else {
                    right = middle - 1
                }
            }
            answers[i] = left
        }
        return answers
    }
    
    func answerQueries2(_ nums: [Int], _ queries: [Int]) -> [Int] {
        let nums = nums.sorted()
        var answers = Array(repeating: 0, count: queries.count)
        var sum = 0
        var count = 0
        for (i, maxSum) in queries.enumerated() {
            sum = 0
            count = 0
            for num in nums {
                sum += num
                if sum > maxSum {
                    break
                }
                count += 1
            }
            answers[i] = count
        }
        return answers
    }

    func tests() {
        print(answerQueries([4,5,2,1],[3,10,21])) // [2,3,4]
        print(answerQueries([2,3,4,5], [1])) // [0]
    }
}
