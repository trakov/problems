class TrappingRainWater {
    func trap(_ height: [Int]) -> Int {
        var left = 0
        var right = height.count - 1
        var leftMax = 0
        var rightMax = 0
        var result = 0
        while left < right {
            if height[left] < height[right] {
                if height[left] >= leftMax {
                    leftMax = height[left]
                } else {
                    result += leftMax - height[left]
                }
                left += 1
            } else {
                if height[right] >= rightMax {
                    rightMax = height[right]
                } else {
                    result += rightMax - height[right]
                }
                right -= 1
            }
        }
        return result
    }

    func trap2(_ height: [Int]) -> Int {
        guard height.count > 2 else { return 0 }
        var result = 0
        var i = 0
        var stack: [Int] = []
        while i < height.count {
            while !stack.isEmpty && height[i] > height[stack.last!] {
                let top = stack.popLast()!
                guard !stack.isEmpty else { break }
                let distance = i - stack.last! - 1
                let boundedHeight = min(
                    height[i],
                    height[stack.last!]
                ) - height[top]
                result += distance * boundedHeight
            }
            stack.append(i)
            i += 1
        }
        return result
    }

    func tests() {
        print(trap([0,1,0,2,1,0,1,3,2,1,2,1])) // 6
        
        print(trap([0,1,2,3,0,1,3,2,1,2,1,0])) // 6
        
        print(trap([4,2,0,3,2,5])) // 9
    }
}
