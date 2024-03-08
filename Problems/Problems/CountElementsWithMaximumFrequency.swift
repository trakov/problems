class CountElementsWithMaximumFrequency {
    func maxFrequencyElements(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n > 2 else { return n }
        var map: [Int: Int] = [:]
        var maxFreq = 0
        var result = 0
        for num in nums {
            map[num, default: 0] += 1
            let freq = map[num]!
            if freq > maxFreq {
                result = freq
                maxFreq = freq
            } else if freq == maxFreq {
                result += freq
            }
        }
        return result
    }

    func maxFrequencyElements2(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n > 2 else { return n }
        var map: [Int: Int] = [:]
        var maxFreq = 0
        for num in nums {
            map[num, default: 0] += 1
            maxFreq = max(maxFreq, map[num]!)
        }
        var result = n
        for (_, freq) in map where freq != maxFreq {
            result -= freq
        }
        return result
    }
    
    func tests() {
        print(maxFrequencyElements([1,2,2,3,1,4])) // 4
        print(maxFrequencyElements([1,2,3,4,5])) // 5
    }
}

