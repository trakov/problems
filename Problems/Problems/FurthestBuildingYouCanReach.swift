class FurthestBuildingYouCanReach {
    func furthestBuilding(_ heights: [Int], _ bricks: Int, _ ladders: Int) -> Int {
        func isPossible(_ maxIndex: Int) -> Bool {
            var diffs: [Int] = []
            for i in 0..<maxIndex {
                let diff = heights[i + 1] - heights[i]
                if diff > 0 {
                    diffs.append(diff)
                }
            }
            diffs.sort(by: >)
            var bricks = bricks
            var ladders = ladders
            for diff in diffs {
                if ladders > 0 {
                    ladders -= 1
                } else if bricks >= diff {
                    bricks -= diff
                } else {
                    return false
                }
            }
            return true
        }
        var left = 0
        var right = heights.count - 1
        while left < right {
            let mid = left + (right - left + 1) / 2
            if isPossible(mid) {
                left = mid
            } else {
                right = mid - 1
            }
        }
        return left
    }

    func tests() {
        print(furthestBuilding([4,2,7,6,9,14,12], 5, 1)) // 4
        print(furthestBuilding([4,2,7,6,9,14,12], 10, 2)) // 7
        print(furthestBuilding([14,3,19,3], 17, 0)) // 3
    }
}

