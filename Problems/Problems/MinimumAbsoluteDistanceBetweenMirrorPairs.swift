final class MinimumAbsoluteDistanceBetweenMirrorPairs {
    func minMirrorPairDistance(_ nums: [Int]) -> Int {
        func reversed(_ num: Int) -> Int {
            var num = num
            var res = 0
            while num > 0 {
                res = res * 10 + num % 10
                num /= 10
            }
            return res
        }
        let n = nums.count
        guard n > 1 else { return -1 }
        var map: [Int: Int] = [:] // reversed num: index
        var result = Int.max
        for (i, num) in nums.enumerated() {
            if let j = map[num] {
                result = min(result, i - j)
            }
            map[reversed(num)] = i
        }
        return result == Int.max ? -1 : result
    }
    
    func tests() {
        print(minMirrorPairDistance([12,21,45,33,54])) // 1
        print(minMirrorPairDistance([120,21])) // 1
        print(minMirrorPairDistance([21,120])) // -1
    }
}
