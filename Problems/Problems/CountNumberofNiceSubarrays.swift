class CountNumberofNiceSubarrays {
    func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        let n = nums.count
        var oddCount = 0
        var left = 0
        var leftOdd = -1
        var rightOdd = 0
        for (i, num) in nums.enumerated() {
            if num % 2 == 1 {
                oddCount += 1
                if leftOdd == -1 { leftOdd = i }
                if oddCount == k {
                    rightOdd = i
                } else if oddCount > k {
                    result += (leftOdd - left + 1) * (i - rightOdd)
                    leftOdd += 1
                    left = leftOdd
                    while nums[leftOdd] % 2 == 0 {
                        leftOdd += 1
                    }
                    oddCount -= 1
                    rightOdd = i
                }
            }
        }
        if oddCount == k {
            result += (leftOdd - left + 1) * (n - rightOdd)
        }
        return result
    }
    
    func tests() {
        print(numberOfSubarrays([1,1,2,1,1], 3)) // 2
        print(numberOfSubarrays([2,4,6], 1)) // 0
        print(numberOfSubarrays([2,2,2,1,2,2,1,2,2,2], 2)) // 16
    }
}

