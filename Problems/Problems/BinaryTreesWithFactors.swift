class BinaryTreesWithFactors {
    func numFactoredBinaryTrees(_ arr: [Int]) -> Int {
        let arr = arr.sorted()
        let mod = 1_000_000_007
        var map: [Int: Int] = [:]
        for (i, num) in arr.enumerated() {
            map[num] = 1
            for j in 0..<i where num % arr[j] == 0 {
                map[num]! += map[arr[j]]! * map[num / arr[j], default: 0]
            }
        }
        return map.values.reduce(0, +) % mod
    }
    
    func tests() {
        print(numFactoredBinaryTrees([2,4])) // 3
        print(numFactoredBinaryTrees([2,4,5,10])) // 7
        print(numFactoredBinaryTrees([15,13,22,7,11])) // 5
    }
}

