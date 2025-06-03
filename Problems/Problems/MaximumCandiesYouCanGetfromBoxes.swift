final class MaximumCandiesYouCanGetfromBoxes {
    func maxCandies(_ status: [Int], _ candies: [Int], _ keys: [[Int]], _ containedBoxes: [[Int]], _ initialBoxes: [Int]) -> Int {
        var queue = initialBoxes
        var result = 0
        var keySet: Set<Int> = []
        while !queue.isEmpty {
            let curr = queue.removeFirst()
            if status[curr] == 1 || keySet.contains(curr) {
                result += candies[curr]
                queue += containedBoxes[curr]
                for key in keys[curr] {
                    keySet.insert(key)
                }
            } else {
                if !queue.isEmpty {
                    queue.append(curr)
                }
            }
        }
        return result
    }
    
    func tests() {
        print(maxCandies([1,0,1,0], [7,5,4,100], [[],[],[1],[]], [[1,2],[3],[],[]], [0])) // 16
        print(maxCandies([1,0,0,0,0,0], [1,1,1,1,1,1], [[1,2,3,4,5],[],[],[],[],[]], [[1,2,3,4,5],[],[],[],[],[]], [0])) // 6
    }
}
