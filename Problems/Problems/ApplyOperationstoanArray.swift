class ApplyOperationstoanArray {
    func applyOperations(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var result = Array(repeating: 0, count: n)
        var j = 0
        var i = 0
        while i < n {
            let num = nums[i]
            if num == 0 {
                i += 1
            } else if i < n - 1, num == nums[i + 1] {
                result[j] = num * 2
                i += 2
                j += 1
            } else {
                result[j] = num
                i += 1
                j += 1
            }
        }
        return result
    }
    
    func tests() {
        print(applyOperations([1,2,2,1,1,0])) // [1,4,2,0,0,0]
        print(applyOperations([0,1])) // [1,0]
        print(applyOperations([0,1,0])) // [1,0,0]
        print(applyOperations([0,1,1])) // [2,0,0]
    }
}

