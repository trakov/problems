class RankTransformofanArray {
    func arrayRankTransform(_ arr: [Int]) -> [Int] {
        let n = arr.count
        let sorted = Set(arr).sorted()
        var map: [Int: Int] = [:] // num : count of not bigger unique vals
        for (i, num) in sorted.enumerated() {
            map[num] = i + 1
        }
        var result = Array(repeating: 1, count: n)
        for (i, num) in arr.enumerated() {
            result[i] = map[num]!
        }
        return result
    }

    func tests() {
        print(arrayRankTransform([40,10,20,30])) // [4,1,2,3]
        print(arrayRankTransform([100,100,100])) // [1,1,1]
        print(arrayRankTransform([37,12,28,9,100,56,80,5,12]))
        // [5,3,4,2,8,6,7,1,3]
    }
}

