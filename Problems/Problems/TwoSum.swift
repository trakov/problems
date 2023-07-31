class TwoSum {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var d: [Int: Int] = [:] // num:index
        for (i, n) in nums.enumerated() {
            let compl = target - n
            if d[compl] != nil {
                return [d[compl]!, i]
            }
            d[n] = i
        }
        return []
    }
    
    func tests() {
        print(twoSum([2,7,11,15], 9)) // 0,1
        print(twoSum([3,2,4], 6)) // 1,2
        print(twoSum([3,3], 6)) // 0,1
    }
}
