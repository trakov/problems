final class TwoFurthestHousesWithDifferentColors {
    func maxDistance(_ colors: [Int]) -> Int {
        let n = colors.count
        if colors[0] != colors[n-1] {
            return n-1
        }
        var result = 0
        for i in 1..<n where colors[i] != colors[0] {
            result = max(i, n - i - 1)
            break
        }
        for i in (1...n-1).reversed() where colors[i] != colors[0] {
            result = max(result, i, n - i - 1)
            break
        }
        return result
    }
    
    func tests() {
        print(maxDistance([1,1,1,6,1,1,1])) // 3
        print(maxDistance([1,8,3,8,3])) // 4
        print(maxDistance([0, 1])) // 1
        print(maxDistance([4,4,4,11,4,4,11,4,4,4,4,4])) // 8
    }
}
