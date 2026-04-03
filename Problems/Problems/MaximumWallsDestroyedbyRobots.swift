final class MaximumWallsDestroyedbyRobots {
    func maxWalls(_ robots: [Int], _ distance: [Int], _ walls: [Int]) -> Int {
        let n = robots.count
        var robotDist = Array(repeating: Array(repeating: 0, count: 2), count: n)
        for i in 0..<n {
            robotDist[i][0] = robots[i]
            robotDist[i][1] = distance[i]
        }
        robotDist.sort { $0[0] < $1[0] }
        let walls = walls.sorted()
        let m = walls.count
        var (rightPtr, leftPtr, curPtr, robotPtr) = (0, 0, 0, 0)
        var (prevRight, subLeft, subRight) = (0, 0, 0)
        for (i, robot) in robotDist.enumerated() {
            let (robotPos, robotDistVal) = (robot[0], robot[1])
            while rightPtr < m && walls[rightPtr] <= robotPos {
                rightPtr += 1
            }
            let pos1 = rightPtr
            while curPtr < m && walls[curPtr] < robotPos {
                curPtr += 1
            }
            let pos2 = curPtr
            var leftBound = robotPos - robotDistVal
            if i >= 1 {
                leftBound = max(robotPos - robotDistVal, robotDist[i - 1][0] + 1)
            }
            while leftPtr < m && walls[leftPtr] < leftBound {
                leftPtr += 1
            }
            let leftPos = leftPtr
            let currentLeft = pos1 - leftPos
            var rightBound = robotPos + robotDistVal
            if i < n - 1 {
                rightBound = min(robotPos + robotDistVal, robotDist[i + 1][0] - 1)
            }
            while rightPtr < m && walls[rightPtr] <= rightBound {
                rightPtr += 1
            }
            let rightPos = rightPtr
            let currentRight = rightPos - pos2
            var currentNum = 0
            if i > 0 {
                while robotPtr < m && walls[robotPtr] < robotDist[i - 1][0] {
                    robotPtr += 1
                }
                currentNum = pos1 - robotPtr
            }
            if i == 0 {
                subLeft = currentLeft
                subRight = currentRight
            } else {
                let newsubLeft = max(
                    subLeft + currentLeft,
                    subRight - prevRight + min(currentLeft + prevRight, currentNum)
                )
                let newsubRight = max(subLeft + currentRight, subRight + currentRight)
                subLeft = newsubLeft
                subRight = newsubRight
            }
            prevRight = currentRight
        }
        return max(subLeft, subRight)
    }
    
    func tests() {
        print(maxWalls([4], [3], [1,10])) // 1
        print(maxWalls([10,2], [5,1], [5,2,7])) // 3
        print(maxWalls([1,2], [100,1], [10])) // 0
    }
}
