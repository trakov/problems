class MostStonesRemovedWithSameRowOrColumn {
    func removeStones(_ stones: [[Int]]) -> Int {
        var xStones: [Int: [Int]] = [:]
        var yStones: [Int: [Int]] = [:]
        for s in stones {
            xStones[s[0], default: []].append(s[1])
            yStones[s[1], default: []].append(s[0])
        }
        
        var count = 0
        while !xStones.isEmpty {
            let firstX = xStones.first!.key
            removeXRecursively(with: firstX, xStones: &xStones, yStones: &yStones)
            count += 1
        }
        return stones.count - count
    }
    
    func removeXRecursively(with x: Int, xStones: inout [Int: [Int]], yStones: inout [Int: [Int]]) {
        guard let xstonesYValues = xStones.removeValue(forKey: x) else {
            return
        }
        for yValue in xstonesYValues {
            for xValue in yStones[yValue]! {
                removeXRecursively(with: xValue, xStones: &xStones, yStones: &yStones)
            }
        }
    }

    func tests() {
        print(removeStones([[0,0],[0,1],[1,0],[1,2],[2,1],[2,2]])) // 5
        print(removeStones([[0,0],[0,2],[1,1],[2,0],[2,2]])) // 3
        print(removeStones([[0,0]])) // 0
    }
}
