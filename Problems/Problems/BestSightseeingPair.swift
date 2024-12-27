class BestSightseeingPair {
    func maxScoreSightseeingPair(_ values: [Int]) -> Int {
        var result = 0
        var left = values[0]
        for (i, val) in values.enumerated().dropFirst() {
            result = max(result, left + val - i)
            left = max(left, val + i)
        }
        return result
    }
    
    func tests() {
        print(maxScoreSightseeingPair([8,1,5,2,6])) // 11
        print(maxScoreSightseeingPair([1,2])) // 2
    }
}

