class ContinuousSubarraySum {
    func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
        var prefixMod = 0
        var modSeen = [0: -1]
        for i in 0..<nums.count {
            prefixMod = (prefixMod + nums[i]) % k
            if let modIndex = modSeen[prefixMod] {
                if i - modIndex > 1 {
                    return true
                }
            } else {
                modSeen[prefixMod] = i
            }
        }
        return false
    }
    
    func tests() {
        print(checkSubarraySum([23,2,4,6,7], 6)) // true
        print(checkSubarraySum([23,2,6,4,7], 6)) // true
        print(checkSubarraySum([23,2,6,4,7], 13)) // false
        print(checkSubarraySum([23,2,4,6,6], 7)) // true
    }
}

