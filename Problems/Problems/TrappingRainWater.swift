class TrappingRainWater {
    func trap(_ height: [Int]) -> Int {
        guard height.count > 2 else {
            return 0
        }
        var dict = [Int: Int]()
        var result = 0
        var leftIndex = 0
        var index = 0
        while index < height.count {
            let diff = height[index + 1] - height[index]
            
            if diff >= 0 && dict.isEmpty {
                leftIndex += 1
                continue
            }
            dict[index + 1] = diff
            
        }
        
        return result
    }

    func tests() {
        print(trap([0,1,0,2,1,0,1,3,2,1,2,1])) // 6
        
        print(trap([0,1,2,3,0,1,3,2,1,2,1,0])) // 6
        
        print(trap([4,2,0,3,2,5])) // 9
    }
}
