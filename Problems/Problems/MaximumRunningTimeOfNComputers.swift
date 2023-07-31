class MaximumRunningTimeOfNComputers {
    func maxRunTime(_ n: Int, _ batteries: [Int]) -> Int {
        guard n > 1 else { return batteries.reduce(0, +) }
        guard batteries.count > n else { return batteries.min()! }
        var batteries = batteries.sorted()
        var live = Array(batteries[(batteries.count - n)..<batteries.count])
        var extra = batteries[0..<batteries.count - n].reduce(0, +)
        for i in 0..<n - 1 {
            if extra < (i + 1) * (live[i + 1] - live[i]) {
                return live[i] + extra / (i + 1)
            }
            extra -= (i + 1) * (live[i + 1] - live[i])
        }
        return live[n - 1] + extra / n
    }

    func maxRunTime2(_ n: Int, _ batteries: [Int]) -> Int {
        guard batteries.count > n else { return batteries.min()! }
        var heap = Heap(array: batteries, sort: >)
        var result = 0
        while heap.count >= n {
            var values = Array(repeating: 0, count: n)
            for i in 0..<n {
                values[i] = heap.remove()! - 1
            }
            for val in values where val > 0 {
                heap.insert(val)
            }
            result += 1
        }
        
        return result
    }

    func tests() {
        print(maxRunTime(2, [3,3,3])) // 4
        print(maxRunTime(2, [1,1,1,1])) // 2
        print(maxRunTime(3, [10,10,5,3])) // 8
        print(maxRunTime(4, [8,1,4,8])) // 1
        print(maxRunTime(2, [31,87,85,44,47,25])) // 159
    }
}

