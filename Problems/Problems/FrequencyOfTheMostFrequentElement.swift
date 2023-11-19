class FrequencyOfTheMostFrequentElement {
    func maxFrequency(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        let nums = nums.sorted()
        var result = 1
        var left = 0
        var k = k
        for right in 0..<n {
            k += nums[right]
            while k < nums[right] * (right - left + 1) {
                k -= nums[left]
                left += 1
            }
            result = max(result, right - left + 1)
        }
        return result
    }

    func maxFrequency2(_ nums: [Int], _ k: Int) -> Int {
        let nums = nums.sorted()
        var result = 1
        
        func count(of index: Int) -> Int {
            var k = k
            var res = 0
            let num = nums[index]
            var i = index
            while i >= 0 && k >= num - nums[i] {
                k -= (num - nums[i])
                i -= 1
                res += 1
            }
            return res
        }
        
        var i = nums.count - 1
        var lastChecked = -1
        while i >= 0 {
            if lastChecked != nums[i] {
                result = max(result, count(of: i))
                lastChecked = nums[i]
            }
            i -= 1
        }
        return result
    }
    
    func tests() {
        print(maxFrequency([1,2,4], 5)) // 3
        print(maxFrequency([1,4,8,13], 5)) // 2
        print(maxFrequency([3,9,6], 2)) // 1
    }
}

