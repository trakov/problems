class CountNumberofBadPairs {
    func countBadPairs(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n > 1 else { return 0 }
        var map: [Int: Int] = [:]
        var result = n * (n - 1) / 2
        for (i, num) in nums.enumerated() {
            if let diffCount = map[i - num] {
                result -= diffCount
                map[i - num] = diffCount + 1
            } else {
                map[i - num] = 1
            }
        }
        return result
    }
    
    func tests() {
        print(countBadPairs([4,1,3,3])) // 5
        print(countBadPairs([1,2,3,4,5])) // 0
    }
}

