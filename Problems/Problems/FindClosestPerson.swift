final class FindClosestPerson {
    func findClosest(_ x: Int, _ y: Int, _ z: Int) -> Int {
        let dx = abs(z - x)
        let dy = abs(z - y)
        if dx < dy { return 1 }
        if dx > dy { return 2 }
        return 0
    }
    
    func tests() {
        print(findClosest(2, 7, 4)) // 1
        print(findClosest(2, 5, 6)) // 2
        print(findClosest(1, 5, 3)) // 0
    }
}
