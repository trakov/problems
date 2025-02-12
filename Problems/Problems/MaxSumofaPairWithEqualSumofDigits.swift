class MaxSumofaPairWithEqualSumofDigits {
    func maximumSum(_ nums: [Int]) -> Int {
        guard nums.count > 1 else { return -1 }
        func digitsSum(_ num: Int) -> Int {
            guard num > 0 else { return 0 }
            return num % 10 + digitsSum(num / 10)
        }
        var map: [Int: (Int, Int)] = [:]
        for num in nums {
            let sum = digitsSum(num)
            if var maxNums = map[sum] {
                if num >= maxNums.0 {
                    maxNums = (num, maxNums.0)
                } else if num > maxNums.1 {
                    maxNums.1 = num
                }
                map[sum] = maxNums
            } else {
                map[sum] = (num, 0)
            }
        }
        var result = -1
        for nums in map.values where nums.1 != 0 {
            result = max(result, nums.0 + nums.1)
        }
        return result
    }
    
    func tests() {
        print(maximumSum([18,43,36,13,7])) // 54
        print(maximumSum([10,12,19,14])) // -1
    }
}

