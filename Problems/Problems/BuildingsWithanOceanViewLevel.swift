class BuildingsWithanOceanViewLevel {
    func buildings(_ heights: [Int]) -> [Int] {
        let n = heights.count
        var result: [Int] = [n - 1]
        guard n > 1 else { return result }
        for i in (0..<n-1).reversed() where heights[i] > heights[result.last!] {
            result.append(i)
        }
        return result.reversed()
    }
    
    func tests() {
        print(buildings([4,2,3,1])) // [0,2,3]
        print(buildings([4,3,2,1])) // [0,1,2,3]
        print(buildings([1,3,2,4])) // [3]
        print(buildings([2,2,2,2])) // [3]
    }
}

