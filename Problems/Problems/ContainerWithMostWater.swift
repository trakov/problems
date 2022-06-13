class ContainerWithMostWater {
    func maxArea(_ height: [Int]) -> Int {
        guard height.count > 1 else {
            return 0
        }
        var volume = 0
        
        var leftIndex = 0
        var rightIndex = height.count - 1
        
        while leftIndex < rightIndex {
            let left = height[leftIndex]
            let right = height[rightIndex]
            let min = min(left, right)
            volume = max(volume, min * (rightIndex - leftIndex))
            if left == min {
                leftIndex += 1
                while leftIndex < rightIndex {
                    if height[leftIndex] <= left {
                        leftIndex += 1
                    } else {
                        break
                    }
                }
            }
            if right == min {
                rightIndex -= 1
                while leftIndex < rightIndex {
                    if height[rightIndex] <= right {
                        rightIndex -= 1
                    } else {
                        break
                    }
                }
            }
        }
        
        return volume
    }

    func tests() {
        print(maxArea([1,8,6,2,5,4,8,3,7])) // 49
        print(maxArea([1, 1])) // 1
        print(maxArea([1, 0, 1])) // 2
        print(maxArea([1, 2, 0, 2, 1])) // 4
    }
}
