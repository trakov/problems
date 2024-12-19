class MaxChunksToMakeSorted {
    func maxChunksToSorted(_ arr: [Int]) -> Int {
        guard arr.count > 1 else { return 1 }
        var result = 0
        var maxNum = 0
        for (i, num) in arr.enumerated() {
            maxNum = max(maxNum, num)
            if maxNum == i {
                result += 1
            }
        }
        return result
    }
    
    func tests() {
        print(maxChunksToSorted([4,3,2,1,0])) // 1
        print(maxChunksToSorted([1,0,2,3,4])) // 4
    }
}

