final class XORAfterRangeMultiplicationQueriesI {
    func xorAfterQueries(_ nums: [Int], _ queries: [[Int]]) -> Int {
        let mod = 1_000_000_007
        var nums = nums
        for q in queries {
            let (l, r, k, v) = (q[0], q[1], q[2], q[3])
            var i = l
            while i <= r {
                nums[i] = (nums[i] * v) % mod
                i += k
            }
        }
        return nums.reduce(0, ^)
    }
    
    func tests() {
        print(xorAfterQueries([1,1,1], [[0,2,1,4]])) // 4
        print(xorAfterQueries([2,3,1,5,4], [[1,4,2,3],[0,2,1,2]])) // 31
    }
}
