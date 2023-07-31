class SubarraySumsDivisibleByK {
    func subarraysDivByK(_ nums: [Int], _ k: Int) -> Int {
        var prefixMod = 0
        var result = 0
        var modGroups = Array(repeating: 0, count: k)
        modGroups[0] = 1

        for num in nums {
            prefixMod = (prefixMod + num % k + k) % k
            result += modGroups[prefixMod]
            modGroups[prefixMod] += 1
        }

        return result
    }

    func tests() {
        print(subarraysDivByK([2,0,3,2], 5)) // 4
        print(subarraysDivByK([4,5,0,-2,-3,1], 5)) // 7
        print(subarraysDivByK([5], 9)) // 0
    }
}
