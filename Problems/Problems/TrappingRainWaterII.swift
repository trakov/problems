//import HeapModule
class TrappingRainWaterII {
    struct Cell: Comparable {
        let x: Int
        let y: Int
        let z: Int
        static func < (lhs: Cell, rhs: Cell) -> Bool { lhs.z < rhs.z }
    }

    func trapRainWater(_ heights: [[Int]]) -> Int {
//        let (rows, cols) = (heights.count, heights[0].count)
//        let borders = chain(
//            (0..<rows).lazy.flatMap {y in [(0,y),(cols-1,y)]},
//            (0..<cols).lazy.flatMap {x in [(x,0),(x,rows-1)]}
//        )
//        var heap = Heap(borders.map{x,y in Cell(x:x, y:y, z:heights[y][x]) })
//        var visited = Array(repeating: false, count: cols*rows)
//        borders.forEach {x,y in visited[y*cols + x] = true}
        var count = 0
//
//        while let item = heap.popMin() {
//            for (dx,dy) in [0,1,0,-1,0].adjacentPairs() {
//                let (x,y) = (item.x + dx, item.y + dy)
//                guard
//                    0..<rows ~= y, 0..<cols ~= x,
//                    !visited[y*cols + x]
//                else { continue }
//                heap.insert(Cell(x:x, y:y, z:max(heights[y][x], item.z)))
//                visited[y*cols + x] = true
//                count += max(0, item.z - heights[y][x])
//            }
//        }
        return count
    }
    
    func tests() {
        print(trapRainWater([[1,4,3,1,3,2],[3,2,1,3,2,4],[2,3,3,2,3,1]])) // 4
        print(trapRainWater([[3,3,3,3,3],[3,2,2,2,3],[3,2,1,2,3],[3,2,2,2,3],[3,3,3,3,3]])) // 10
    }
}

