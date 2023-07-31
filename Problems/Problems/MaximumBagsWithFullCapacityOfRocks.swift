class MaximumBagsWithFullCapacityOfRocks {
    func maximumBags(_ capacity: [Int], _ rocks: [Int], _ additionalRocks: Int) -> Int {
        var leftCapacity: [Int] = []
        for (i,cap) in capacity.enumerated() {
            if cap-rocks[i] > 0 {
                leftCapacity.append(cap-rocks[i])
            }
        }
        var count = capacity.count - leftCapacity.count
        leftCapacity.sort(by: >)
        var leftRocks = additionalRocks
        while leftRocks > 0 && !leftCapacity.isEmpty {
            let leftCap = leftCapacity.removeLast()
            if leftCap <= leftRocks {
                count += 1
                leftRocks -= leftCap
            } else {
                break
            }
        }
        return count
    }

    func tests() {
        print(maximumBags([2,3,4,5], [1,2,4,4], 2)) // 3
        print(maximumBags([10,2,2], [2,2,0], 100)) // 3
    }
}
