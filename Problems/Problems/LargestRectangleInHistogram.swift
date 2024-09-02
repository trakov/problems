class LargestRectangleInHistogram {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var stack: [Int] = []
        var result = 0
        let heights = heights + [0]
        for (i, h) in heights.enumerated() {
            while let hIdx = stack.last, heights[hIdx] >= h {
                let hIdx = stack.removeLast()
                let tHeight = heights[hIdx]
                let leftIdx = !stack.isEmpty ? stack.last! : -1
                result = max(result, (i - leftIdx - 1) * tHeight)
            }
            stack.append(i)
        }
        return result
    }
    
    func tests() {
        print(largestRectangleArea([2,1,2])) // 3
        print(largestRectangleArea([1,1])) // 2
        print(largestRectangleArea([2,1,5,6,2,3])) // 10
        print(largestRectangleArea([2,4])) // 4
    }
}

