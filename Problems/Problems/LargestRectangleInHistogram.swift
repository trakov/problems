class LargestRectangleInHistogram {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        return stackSolution(heights)
        
        let n = heights.count
        guard n > 0 else { return 0 }
        guard n > 1 else { return heights[0] }
        var result = 0
        var lessFromLeft = Array(repeating: 0, count: n)
        var lessFromRight = Array(repeating: 0, count: n)
        lessFromRight[n - 1] = n
        lessFromLeft[0] = -1
        for i in 1..<n {
            var p = i - 1
            while p >= 0 && heights[p] >= heights[i] {
                p = lessFromLeft[p]
            }
            lessFromLeft[i] = p
        }
        for i in (0...n - 2).reversed() {
            var p = i + 1
            while p < n && heights[p] >= heights[i] {
                p = lessFromRight[p]
            }
            lessFromRight[i] = p
        }
        for (i, h) in heights.enumerated() {
            result = max(result, h * (lessFromRight[i] - lessFromLeft[i] - 1))
        }
        return result
    }
    
    func stackSolution(_ heights: [Int]) -> Int {
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
        print(largestRectangleArea([2,1,5,6,2,3])) // 10
        print(largestRectangleArea([2,4])) // 4
    }
}

