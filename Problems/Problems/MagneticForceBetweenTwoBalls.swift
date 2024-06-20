class MagneticForceBetweenTwoBalls {
    func maxDistance(_ position: [Int], _ m: Int) -> Int {
        let position = position.sorted()
        let n = position.count
        var result = 0
        
        func canPlace(_ x: Int) -> Bool {
            var prevBallPos = position[0]
            var ballsPlaced = 1
            for i in 1..<n {
                guard ballsPlaced < m else { break }
                let currPos = position[i]
                if currPos - prevBallPos >= x {
                    ballsPlaced += 1
                    prevBallPos = currPos
                }
            }
            return ballsPlaced == m
        }
        
        var left = 0
        var right = position[n - 1] / (m - 1)
        while left <= right {
            let mid = left + (right - left) / 2
            if canPlace(mid) {
                result = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return result
    }
    
    func tests() {
        print(maxDistance([0,1], 2)) // 1
        print(maxDistance([1,2,3,4,7], 3)) // 3
        print(maxDistance([5,4,3,2,1,1000000000], 2)) // 999999999
    }
}

