class FindPolygonWithTheLargestPerimeter {
    func largestPerimeter(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        var result = nums.reduce(0, +)
        for (i, num) in nums.enumerated().reversed() {
            guard i > 1 else { return -1 }
            guard num >= result - num else { break }
            result -= num
        }
        return result
    }
    
    func tests() {
        print(largestPerimeter([5,5,5])) // 15
        print(largestPerimeter([1,12,1,2,5,50,3])) // 12
        print(largestPerimeter([5,5,50])) // -1
    }
}

