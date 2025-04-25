final class CountofInterestingSubarrays {
    func countInterestingSubarrays(_ nums: [Int], _ modulo: Int, _ k: Int) -> Int {
        let n = nums.count
        var cnt: [Int: Int] = [0: 1]
        var res = 0
        var prefix = 0
        for num in nums {
            prefix += num % modulo == k ? 1 : 0
            res += cnt[(prefix - k + modulo) % modulo, default: 0]
            cnt[prefix % modulo, default: 0] += 1
        }
        return res
    }
    
    func tests() {
        print(countInterestingSubarrays([3,2,4], 2, 1)) // 3
        print(countInterestingSubarrays([3,1,9,6], 3, 0)) // 2
    }
}
