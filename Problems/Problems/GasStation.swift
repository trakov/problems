class GasStation {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        var sum = 0
        var current = 0
        var index = 0
        for (i, g) in gas.enumerated() {
            let c = cost[i]
            sum += g - c
            current += g - c
            if current < 0 {
                current = 0
                index = i + 1
            }
        }
        return sum >= 0 ? index : -1
    }

    func tests() {
        print(canCompleteCircuit([3,1,1], [1,2,2])) //
//        print(canCompleteCircuit([6,1,4,3,5], [3,8,2,4,2])) // 2
//        print(canCompleteCircuit([4,4,4,4,4,4], [5,5,3,5,5,1])) // 5
//        print(canCompleteCircuit([1,2,3,4,5], [3,4,5,1,2])) // 3
//        print(canCompleteCircuit([1,2,3,4], [3,4,1,2])) // 2
//        print(canCompleteCircuit([2,3,4], [3,4,3])) // -1
    }
}
