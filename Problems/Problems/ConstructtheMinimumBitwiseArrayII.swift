final class ConstructtheMinimumBitwiseArrayII {
    func minBitwiseArray(_ nums: [Int]) -> [Int] {
        nums.map { num in
            var res = -1
            var d = 1
            while (num & d) != 0 {
                res = num - d
                d <<= 1
            }
            return res
        }
    }
    
    func tests() {
        print(minBitwiseArray([2,3,5,7])) // [-1,1,4,3]
        print(minBitwiseArray([11,13,31])) // [9,12,15]
    }
}
