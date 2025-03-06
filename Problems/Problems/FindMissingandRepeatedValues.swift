class FindMissingandRepeatedValues {
    func findMissingAndRepeatedValues(_ grid: [[Int]]) -> [Int] {
        let total = grid.count * grid.count
        var sum = 0
        var sqrSum = 0
        for row in grid {
            for val in row {
                sum += val
                sqrSum += val * val
            }
        }
        let sumDiff = sum - (total * (total + 1)) / 2
        let sqrDiff = sqrSum - (total * (total + 1) * (2 * total + 1)) / 6
        let a = (sqrDiff / sumDiff + sumDiff) / 2
        let b = (sqrDiff / sumDiff - sumDiff) / 2
        return [a, b]
    }
    
    func tests() {
        print(findMissingAndRepeatedValues([[1,3],[2,2]])) // [2,4]
        print(findMissingAndRepeatedValues([[9,1,7],[8,9,2],[3,4,6]])) // [9,5]
    }
}
