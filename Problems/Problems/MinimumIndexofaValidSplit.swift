class MinimumIndexofaValidSplit {
    func minimumIndex(_ nums: [Int]) -> Int {
        let n = nums.count
        var x = nums[0]
        var count = 0
        for num in nums {
            count += num == x ? 1 : -1
            if count == 0 {
                x = num
                count = 1
            }
        }
        let xCount = nums.reduce(0) { $0 + ($1 == x ? 1 : 0) }
        count = 0
        for (i, num) in nums.enumerated() {
            if num == x { count += 1 }
            guard count > 0 && (n/2 - count + 1) != 0 else { continue }
            if (i + 1) / count < 2 && (n - 1 - i) / (xCount - count) < 2 {
                return i
            }
        }
        return -1
    }
    
    func tests() {
        print(minimumIndex([1,1,1])) // 0
        print(minimumIndex([1,2,2,2])) // 2
        print(minimumIndex([2,1,3,1,1,1,7,1,2,1])) // 4
        print(minimumIndex([3,3,3,3,7,2,2])) // -1
    }
}

