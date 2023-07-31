class SmallestRangeII {
    func smallestRangeII(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        let nums = nums.sorted()
        let maxValue = nums.last!
        let minValue = nums.first!
        var result = maxValue - minValue
        for i in 0..<n-1 {
            let a = nums[i]
            let b = nums[i+1]
            let high = max(maxValue - k, a + k)
            let low = min(minValue + k, b - k)
            result = min(result, high - low)
        }
        return result
    }
    
    func smallestRangeII2(_ nums: [Int], _ k: Int) -> Int { // not working....
        var minValue = Int.max
        var maxValue = Int.min
        for num in nums {
            minValue = min(minValue, num)
            maxValue = max(maxValue, num)
        }
        let initialResult = maxValue - minValue
        if initialResult <= k {
            return initialResult
        }
        var middle = Float(maxValue + minValue) / 2
        minValue += k
        maxValue -= k
        for num in nums {
            if Float(num) < middle {
                maxValue = max(minValue, maxValue, num + k)
            } else {
                minValue = min(maxValue, minValue, num - k)
            }
            middle = Float(maxValue + minValue) / 2
        }
        return min(initialResult, maxValue - minValue)
    }
    
    func tests() {
        print(smallestRangeII([8038,9111,5458,8483,5052,9161,8368,2094,8366,9164,53,7222,9284,5059,4375,2667,2243,5329,3111,5678,5958,815,6841,1377,2752,8569,1483,9191,4675,6230,1169,9833,5366,502,1591,5113,2706,8515,3710,7272,1596,5114,3620,2911,8378,8012,4586,9610,8361,1646,2025,1323,5176,1832,7321,1900,1926,5518,8801,679,3368,2086,7486,575,9221,2993,421,1202,1845,9767,4533,1505,820,967,2811,5603,574,6920,5493,9490,9303,4648,281,2947,4117,2848,7395,930,1023,1439,8045,5161,2315,5705,7596,5854,1835,6591,2553,8628], 4643)) // 8870
        print(smallestRangeII([4,8,2,7,2], 5)) // 6
        print(smallestRangeII([3,4,7,0], 5)) // 7
        print(smallestRangeII([1], 0)) // 0
        print(smallestRangeII([0,10], 2)) // 6
        print(smallestRangeII([1,3,6], 3)) // 3
        print(smallestRangeII([2,4,6], 3)) // 4
        print(smallestRangeII([2,4,6], 2)) // 2
    }
}

