class MakeSumDivisiblebyP {
    func minSubarray(_ nums: [Int], _ p: Int) -> Int {
        let n = nums.count
        var totalSum = 0
        for num in nums {
            totalSum = (totalSum + num) % p
        }
        let target = totalSum % p
        if target == 0 { return 0 }

        var modMap: [Int: Int] = [0: -1]
        var currentSum = 0
        var minLen = n

        for (i, num) in nums.enumerated() {
            currentSum = (currentSum + num) % p
            let needed = (currentSum - target + p) % p
            if let index = modMap[needed] {
                minLen = min(minLen, i - index)
            }
            modMap[currentSum] = i
        }
        return minLen == n ? -1 : minLen
    }
    
    func tests() {
        print(minSubarray([3,1,4,2], 6)) // 1
        print(minSubarray([6,3,5,2], 9)) // 2
        print(minSubarray([1,2,3], 3)) // 0
    }
}

