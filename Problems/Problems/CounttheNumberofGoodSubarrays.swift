final class CounttheNumberofGoodSubarrays {
    func countGood(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var same = 0
        var right = -1
        var map: [Int: Int] = [:]
        var result = 0
        for left in 0..<n {
            while same < k && right + 1 < n {
                right += 1
                same += map[nums[right]] ?? 0
                map[nums[right], default: 0] += 1
            }
            if same >= k {
                result += n - right
            }
            map[nums[left], default: 0] -= 1
            same -= map[nums[left]] ?? 0
        }
        return result
    }

    func tests() {
        print(countGood([1,1,1,1,1], 10)) // 1
        print(countGood([3,1,4,3,2,2,4], 2)) // 4
    }
}
