class ContainerWithMostWater2 {
    func maxArea(_ height: [Int]) -> Int {
        guard height.count > 1 else { return 0 }
        var result = 0
        var left = 0
        var right = height.count - 1
        
        while left < right {
            let lh = height[left]
            let rh = height[right]
            result = max(result, min(lh, rh) * (right - left))
            if lh > rh {
                right -= 1
            } else {
                left += 1
            }
        }
        return result
    }
    
    func tests() {
        print(maxArea([1,8,6,2,5,4,8,3,7])) // 49
        print(maxArea([1, 1])) // 1
        print(maxArea([1, 0, 1])) // 2
        print(maxArea([1, 2, 0, 2, 1])) // 4
    }
}
