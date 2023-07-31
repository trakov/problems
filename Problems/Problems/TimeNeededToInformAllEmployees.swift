class TimeNeededToInformAllEmployees {
    func numOfMinutes(_ n: Int, _ headID: Int, _ manager: [Int], _ informTime: [Int]) -> Int {
        var cache = Array(repeating: -1, count: n)
        cache[headID] = 0
        func getTime(_ id: Int) -> Int {
            if cache[id] != -1 { return cache[id] }
            cache[id] = informTime[manager[id]] + getTime(manager[id])
            return cache[id]
        }
        var result = 0
        for i in 0..<n {
            result = max(result, getTime(i))
        }
        return result
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
    func numOfMinutes00(_ n: Int, _ headID: Int, _ manager: [Int], _ informTime: [Int]) -> Int {
        var times = Array(repeating: -1, count: n)
        times[headID] = 0

        @discardableResult func getTotalTime(_ id: Int) -> Int {
            if times[id] != -1 {
                return times[id]
            }
            let managerInformTime = informTime[manager[id]]
            times[id] = getTotalTime(manager[id]) + managerInformTime
            return times[id]
        }

        var result = 0
        for i in 0..<n {
            getTotalTime(i)
            result = max(result, times[i])
        }

        return result
    }

    func numOfMinutes0(_ n: Int, _ headID: Int, _ manager: [Int], _ informTime: [Int]) -> Int {
        var times = Array(repeating: -1, count: n)
        times[headID] = 0

        func getTotalTime(_ id: Int) -> Int {
            if times[id] != -1 {
                return times[id]
            }
            let managerInformTime = informTime[manager[id]]
            return getTotalTime(manager[id]) + managerInformTime
        }

        for i in 0..<n {
            times[i] = getTotalTime(i)
        }

        return times.max()!
    }

    func numOfMinutes2(_ n: Int, _ headID: Int, _ manager: [Int], _ informTime: [Int]) -> Int {
        guard manager.count > 1 else { return 0 }
        var childMap: [Int: [Int]] = [:]
        for (i, m) in manager.enumerated() {
            childMap[m, default: []].append(i)
        }
        var queue = childMap[headID]! // children, indices
        var times = Array(repeating: 0, count: n)
        times[headID] = informTime[headID]
        while !queue.isEmpty {
            var nextQueue: [Int] = []
            for q in queue {
                if let childs = childMap[q] {
                    times[q] = informTime[q] + times[manager[q]]
                    nextQueue.append(contentsOf: childs)
                }
            }
            queue = nextQueue
        }
        return times.max()!
    }

    func tests() {
        print(numOfMinutes(1, 0, [-1], [0])) // 0
        print(numOfMinutes(6, 2, [2,2,-1,2,2,2], [0,0,1,0,0,0])) // 1
        print(numOfMinutes(7, 3, [3,3,0,-1,0,1,1], [2,3,1,1,2,3,4])) // 4
    }
}
