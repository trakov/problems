class CheckIfItIsAStraightLine {
    func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
        let p1 = coordinates[0]
        let p2 = coordinates[1]
        func check(point: [Int]) -> Bool {
            let x = point[0]
            let y = point[1]
            return (x - p1[0]) * (p2[1] - p1[1]) == (y - p1[1]) * (p2[0] - p1[0])
        }
        
        for i in 2..<coordinates.count {
            if !check(point: coordinates[i]) { return false }
        }
        
        return true
    }

    func tests() {
        print(checkStraightLine([[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]])) // true
        print(checkStraightLine([[1,1],[2,2],[3,4],[4,5],[5,6],[7,7]])) // false
    }
}
