class CountNicePairsInAnArray {
    func countNicePairs(_ nums: [Int]) -> Int {
        let n = nums.count
        let mod = 1_000_000_007
        guard n > 1 else { return 0 }
        var map: [Int: Int] = [:]
        var result = 0
        for num in nums {
            var temp = num
            var rev = 0
            while temp != 0 {
                rev = rev * 10 + temp % 10
                temp /= 10
            }
            if let val = map[num - rev] {
                result = (result + val) % mod
                map[num - rev] = val + 1
            } else {
                map[num - rev] = 1
            }
        }
        return result
    }
    
    func tests() {
        print(countNicePairs([42,11,1,97])) // 2
        print(countNicePairs([13,10,35,24,76])) // 4
    }
}

