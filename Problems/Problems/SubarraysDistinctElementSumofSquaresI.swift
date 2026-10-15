final class SubarraysDistinctElementSumofSquaresI {
    func sumCounts(_ nums: [Int]) -> Int {
        var counts: [Int: Int] = [:]
        var set: Set<Int> = []
        for i in nums.indices {
            set = []
            for num in nums.dropFirst(i) {
                set.insert(num)
                counts[set.count, default: 0] += 1
            }
        }
        return counts.reduce(0) {
            $0 + $1.key * $1.key * $1.value
        }
    }
    
    func tests() {
        print(sumCounts([1,2,1])) // 15
        print(sumCounts([1,1])) // 3
    }
}
