class SpecialArrayII {
    func isArraySpecial(_ nums: [Int], _ queries: [[Int]]) -> [Bool] {
        let n = nums.count
        var specs = nums
        var end = 0
        for i in 0..<n {
            end = max(end, i)
            while end < n - 1 && nums[end] % 2 != nums[end + 1] % 2 {
                end += 1
            }
            specs[i] = end
        }
        var result = Array(repeating: false, count: queries.count)
        for (i, q) in queries.enumerated() {
            let start = q[0]
            let endQuery = q[1]
            result[i] = endQuery <= specs[start]
        }
        return result
    }
    
    func tests() {
        print(isArraySpecial([3,4,1,2,6], [[0,4]])) // [false]
        print(isArraySpecial([4,3,1,6], [[0,2],[2,3]])) // [false, true]
    }
}

