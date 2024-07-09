class AverageWaitingTime {
    func averageWaitingTime(_ customers: [[Int]]) -> Double {
        var result = 0
        var curTime = 0
        for customer in customers {
            curTime = max(curTime, customer[0]) + customer[1]
            result += curTime - customer[0]
        }
        return Double(result) / Double(customers.count)
    }

    func averageWaitingTime1(_ customers: [[Int]]) -> Double {
        let n = customers.count
        var result = Array(repeating: 0, count: n)
        var curTime = 0
        for (i, customer) in customers.enumerated() {
            curTime = max(curTime, customer[0]) + customer[1]
            result[i] = curTime - customer[0]
        }
        return Double(result.reduce(0, +)) / Double(n)
    }
    
    func tests() {
        print(averageWaitingTime([[1,2],[3,2],[5,2]])) // 2
        print(averageWaitingTime([[1,2],[2,5],[4,3]])) // 5
        print(averageWaitingTime([[5,2],[5,4],[10,3],[20,1]])) // 3.25
    }
}

