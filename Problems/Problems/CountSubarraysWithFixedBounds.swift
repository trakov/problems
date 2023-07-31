class CountSubarraysWithFixedBounds {
    func countSubarrays(_ nums: [Int], _ minK: Int, _ maxK: Int) -> Int {
        var minFounded = false
        var maxFounded = false
        var res = 0
        var start = 0
        var minStart = 0
        var maxStart = 0
        
        for (i, num) in nums.enumerated() {
            if num < minK || num > maxK {
                minFounded = false
                maxFounded = false
                start = i + 1
                continue
            }
            
            if num == minK {
                minFounded = true
                minStart = i
            }
            
            if num == maxK {
                maxFounded = true
                maxStart = i
            }
            
            if minFounded, maxFounded {
                res += min(minStart, maxStart) - start + 1
            }
        }
        
        return res
    }
    
    func tests() {
        print(countSubarrays([1,3,5,2,7,5], 1, 5)) // 2
        print(countSubarrays([1,1,1,1], 1, 1)) // 10
    }
}
