class NumberofSubarraysWithOddSum {
    func numOfSubarrays(_ arr: [Int]) -> Int {
        let MOD = 1_000_000_007
        var count = 0
        var prefixSum = 0
        var (odd, even) = (0,1)
        for num in arr {
            prefixSum += num
            if prefixSum % 2 == 0 {
                count += odd
                even += 1
            } else {
                count += even
                odd += 1
            }
            count %= MOD
        }
        return count
    }
    
    func tests() {
        print(numOfSubarrays([1,3,5])) // 4
        print(numOfSubarrays([2,4,6])) // 0
        print(numOfSubarrays([1,2,3,4,5,6,7])) // 16
    }
}

