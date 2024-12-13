class FindScoreofanArrayAfterMarkingAllElements {
    func findScore(_ nums: [Int]) -> Int {
        let sorted = nums.enumerated().sorted { $0.element < $1.element }
        var marked = Array(repeating: false, count: nums.count)
        var result = 0
        for (i, num) in sorted where !marked[i] {
            result += num
            marked[i] = true
            if i > 0 { marked[i - 1] = true }
            if i + 1 < nums.count { marked[i + 1] = true }
        }
        return result
    }
    
    func tests() {
        print(findScore([2,1,3,4,5,2])) // 7
        print(findScore([2,3,5,1,3,2])) // 5
    }
}

