class RobotCollisions {
    func survivedRobotsHealths(_ positions: [Int], _ healths: [Int], _ directions: String) -> [Int] {
        let n = positions.count
        let directions = Array(directions)
        var healths = healths
        var indices = Array(0..<n).sorted {
            positions[$0] < positions[$1]
        }
        var result: [Int] = []
        var stack: [Int] = []
        for currentIndex in indices {
            guard directions[currentIndex] == "L" else {
                stack.append(currentIndex)
                continue
            }
            while !stack.isEmpty && healths[currentIndex] > 0 {
                let topIndex = stack.removeLast()
                if healths[topIndex] > healths[currentIndex] {
                    healths[topIndex] -= 1
                    healths[currentIndex] = 0
                    stack.append(topIndex)
                } else if healths[topIndex] < healths[currentIndex] {
                    healths[currentIndex] -= 1
                    healths[topIndex] = 0
                } else {
                    healths[currentIndex] = 0
                    healths[topIndex] = 0
                }
            }
        }
        for index in 0..<n {
            if healths[index] > 0 {
                result.append(healths[index])
            }
        }
        return result
    }
    
    func tests() {
        print(survivedRobotsHealths([5,4,3,2,1], [2,17,9,15,10], "RRRRR"))
        // [2,17,9,15,10]
        print(survivedRobotsHealths([3,5,2,6], [10,10,15,12], "RLRL"))
        // [14]
        print(survivedRobotsHealths([1,2,5,6], [10,10,11,11], "RLRL"))
        // []
    }
}

