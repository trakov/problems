class SummaryRanges {
    func summaryRanges(_ nums: [Int]) -> [String] {
        guard !nums.isEmpty else { return [] }
        guard nums.count > 1 else { return ["\(nums[0])"] }
        var result: [String] = []
        
        var prev = nums[0]
        var first = nums[0]
        var i = 1
        repeat {
            defer { i += 1 }
            let num = nums[i]
            guard num - prev > 1 else {
                prev = num
                continue
            }
        } while i < nums.count
        
        return result
    }

    func summaryRanges2(_ nums: [Int]) -> [String] {
        guard !nums.isEmpty else { return [] }
        guard nums.count > 1 else { return ["\(nums.first!)"] }
        var result: [String] = []
        
        var firstNum = nums.first!
        var prevNum = nums.first!
        for num in nums.dropFirst() {
            if num - prevNum == 1 {
                if nums.last == num {
                    result.append("\(firstNum)->\(num)")
                }
            } else {
                let str = firstNum == prevNum ? "\(firstNum)" : "\(firstNum)->\(prevNum)"
                result.append(str)
                firstNum = num
                if nums.last == num {
                    result.append("\(num)")
                }
            }
            prevNum = num
        }
        
        return result
    }
    
    func tests() {
        print(summaryRanges([0,1,2,4,5,7])) // ["0->2","4->5","7"]
        print(summaryRanges([0,2,3,4,6,8,9])) // ["0","2->4","6","8->9"]
        print(summaryRanges([1])) // ["1"]
        print(summaryRanges([])) // []
    }
}
