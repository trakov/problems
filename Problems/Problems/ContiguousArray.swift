class ContiguousArray {
    func findMaxLength(_ nums: [Int]) -> Int {
        var map: [Int: Int] = [:]
        map[0] = -1
        var result = 0
        var count = 0
        for i in 0..<nums.count {
            count = count + (nums[i] == 1 ? 1 : -1)
            if let val = map[count] {
                result = max(result, i - val)
            } else {
                map[count] = i
            }
        }
        return result
    }
    
    func tests() {
        print(findMaxLength([0,1])) // 2
        print(findMaxLength([0,1,0])) // 2
    }
}

