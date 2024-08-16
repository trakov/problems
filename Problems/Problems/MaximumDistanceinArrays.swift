class MaximumDistanceinArrays {
    func maxDistance(_ arrays: [[Int]]) -> Int {
        var minVal = arrays[0].first!
        var maxVal = arrays[0].last!
        var result = 0
        for arr in arrays.dropFirst() {
            result = max(result, abs(arr.last! - minVal), abs(maxVal - arr.first!))
            minVal = min(minVal, arr.first!)
            maxVal = max(maxVal, arr.last!)
        }
        return result
    }
    
    func tests() {
        print(maxDistance([[1,2,3],[4,5],[1,2,3]])) // 4
        print(maxDistance([[1],[1]])) // 0
    }
}

