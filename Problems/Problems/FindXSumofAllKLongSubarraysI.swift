final class FindXSumofAllKLongSubarraysI {
    func findXSum(_ nums: [Int], _ k: Int, _ x: Int) -> [Int] {
        var map: [Int: Int] = [:]
        var result = Array(repeating: 0, count: nums.count - k + 1)
        func sum(_ map: [Int: Int]) -> Int {
            let sorted = map.sorted { a, b in
                if a.value == b.value { return a.key > b.key }
                return a.value > b.value
            }
            var res = 0
            var x = x
            for (num, count) in sorted {
                guard x > 0 else { break }
                res += num * count
                x -= 1
            }
            return res
        }
        for (i, num) in nums.enumerated() {
            map[num, default: 0] += 1
            if i >= k - 1 {
                let j = i - k + 1
                result[j] = sum(map)
                let left = nums[j]
                map[left, default: 0] -= 1
                if map[left] == 0 { map[left] = nil }
            }
        }
        return result
    }
    
    func tests() {
        print(findXSum([1,1,2,2,3,4,2,3], 6, 2)) // [6,10,12]
        print(findXSum([3,8,7,8,7,5], 2, 2)) // [11,15,15,15,12]
    }
}
