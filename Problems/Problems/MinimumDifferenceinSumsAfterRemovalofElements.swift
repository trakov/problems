import HeapModule
final class MinimumDifferenceinSumsAfterRemovalofElements {
    func minimumDifference(_ nums: [Int]) -> Int {
        let n3 = nums.count
        let n = n3 / 3
        var part1 = Array(repeating: 0, count: n + 1)
        var sum = 0
        var ql = HeapModule.Heap<Int>()
        for i in 0..<n {
            sum += nums[i]
            ql.insert(nums[i])
        }
        part1[0] = sum
        for i in n..<n*2 {
            sum += nums[i]
            ql.insert(nums[i])
            sum -= ql.removeMax()
            part1[i - (n - 1)] = sum
        }
        var part2 = 0
        var qr = HeapModule.Heap<Int>()
        for i in n*2..<n*3 {
            part2 += nums[i]
            qr.insert(nums[i])
        }
        var ans = part1[n] - part2
        for i in (n..<n*2).reversed() {
            part2 += nums[i]
            qr.insert(nums[i])
            part2 -= qr.removeMin()
            ans = min(ans, part1[i - n] - part2)
        }
        return ans
    }
    
    func tests() {
        print(minimumDifference([3,1,2])) // -1
        print(minimumDifference([7,9,5,8,1,3])) // 1
    }
}
