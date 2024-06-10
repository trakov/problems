class HeightChecker {
    func heightChecker(_ heights: [Int]) -> Int {
        let sorted = heights.sorted()
        var result = 0
        for (x, y) in zip(heights, sorted) where x != y {
            result += 1
        }
        return result
    }
    
    func tests() {
        print(heightChecker([1,1,4,2,1,3])) // 3
        print(heightChecker([5,1,2,3,4])) // 5
        print(heightChecker([1,2,3,4,5])) // 0
    }
}

