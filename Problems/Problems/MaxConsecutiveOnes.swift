class MaxConsecutiveOnes {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var m = 0
        var temp = 0
        for num in nums {
            if num == 0 {
                m = max(temp, m)
                temp = 0
            } else {
                temp += 1
            }
        }
        return max(temp, m)
    }

    func tests() {
        print(findMaxConsecutiveOnes([1,1,0,1,1,1])) // 3
        print(findMaxConsecutiveOnes([1,0,1,1,0,1])) // 2
    }
}
