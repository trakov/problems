final class FindtheLargestAlmostMissingInteger {
    func largestInteger(_ nums: [Int], _ k: Int) -> Int {
        var f = Array(repeating: 0, count: 51)
        for num in nums {
            f[num] += 1
        }
        var result = -1
        let n = nums.count
        for (i, num) in nums.enumerated() {
            if k == n || (f[num] == 1 && (k == 1 || i == 0 || i == n - 1)) {
                result = max(result, num)
            }
        }
        return result
     }
    
    func tests() {
        print(largestInteger([3,9,2,1,7], 3)) // 7
        print(largestInteger([3,9,7,2,1,7], 4)) // 3
        print(largestInteger([0,0], 1)) // -1
    }
}
