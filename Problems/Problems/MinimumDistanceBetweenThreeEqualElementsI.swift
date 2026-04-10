final class MinimumDistanceBetweenThreeEqualElementsI {
    func minimumDistance(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n > 2 else { return -1 }
        var map: [Int: (l: Int, r: Int)] = [:]
        var result = Int.max
        for (i, num) in nums.enumerated() {
            if let (l, r) = map[num] {
                if r == -1 {
                    map[num] = (l, i)
                } else {
                    result = min(result, i - l)
                    if result == 2 { break }
                    map[num] = (r, i)
                }
            } else {
                map[num] = (i, -1)
            }
        }
        return result == Int.max ? -1 : result * 2
    }
    
    func tests() {
        print(minimumDistance([1,2,1,1,3])) // 6
        print(minimumDistance([1,1,2,3,2,1,2])) // 8
        print(minimumDistance([1])) // -1
    }
}
