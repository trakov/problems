final class TransformedArray {
    func constructTransformedArray(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var result = nums
        for (i, num) in nums.enumerated() where num != 0 {
            let j = ((i + num) % n + n) % n
            result[i] = nums[j]
        }
        return result
    }
    
    func tests() {
        print(constructTransformedArray([3,-2,1,1])) // [1,1,1,3]
        print(constructTransformedArray([-1,4,-1])) // [-1,-1,4]
        print(constructTransformedArray([-10,10,-20])) // [-1,-1,4]
    }
}
