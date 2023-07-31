class LongestArithmeticSubsequenceOfGivenDifference {
    func longestSubsequence(_ arr: [Int], _ difference: Int) -> Int {
        var map: [Int: Int] = [:] // next_number: count
        var result = 1
        
        for num in arr {
            if let prev = map[num] {
                map[num + difference] = prev + 1
                if difference != 0 {
                    map[num] = nil
                }
                result = max(result, map[num + difference]!)
            } else {
                map[num + difference] = 1
            }
        }
        
        return result
    }
    
    func tests() {
        print(longestSubsequence([4,12,10,0,-2,7,-8,9,-9,-12,-12,8,8], 0)) // 2
        print(longestSubsequence([1,2,3,4], 1)) // 4
        print(longestSubsequence([1,3,5,7], 1)) // 1
        print(longestSubsequence([1,5,7,8,5,3,4,2,1], -2)) // 4
    }
}

