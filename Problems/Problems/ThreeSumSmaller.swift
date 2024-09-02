class ThreeSumSmaller {
    func threeSumSmaller(_ nums: [Int], _ target: Int) -> Int {
        let n = nums.count
        guard n >= 3 else { return 0 }
        var result = 0
        let nums = nums.sorted()
        for (i, num) in nums.enumerated().dropLast(2) {
            var j = i + 1
            var k = n - 1
            while j < k {
                let sum = num + nums[j] + nums[k]
                if sum < target {
                    result += k - j
                    j += 1
                } else {
                    k -= 1
                }
            }
        }
        return result
    }
    
    func tests() {
        print(threeSumSmaller([-2,0,1,3], 2)) // 2
    }
}

