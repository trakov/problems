class PatchingArray {
    func minPatches(_ nums: [Int], _ n: Int) -> Int {
        var cur = 1
        var result = 0
        var i = 0
        while cur <= n {
            if i < nums.count && nums[i] <= cur {
                cur += nums[i]
                i += 1
            } else {
                cur += cur
                result += 1
            }
        }
        return result
    }
    
    func tests() {
        print(minPatches([1,3], 6)) // 1
        print(minPatches([1,5,10], 20)) // 2
        print(minPatches([1,2,2], 5)) // 0
    }
}

