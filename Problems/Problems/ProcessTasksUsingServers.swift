import HeapModule
final class ProcessTasksUsingServers {
    struct Server: Comparable {
        let first: Int
        let second: Int
        static func < (lhs: Server, rhs: Server) -> Bool {
            if lhs.first != rhs.first {
                return lhs.first < rhs.first
            }
            return lhs.second < rhs.second
        }
    }
    func assignTasks(_ servers: [Int], _ tasks: [Int]) -> [Int] {
        var busy = HeapModule.Heap<Server>()
        var idle = HeapModule.Heap<Server>()
        for i in 0..<servers.count {
            idle.insert(Server(first: servers[i], second: i))
        }
        var ts = 0
        var result = Array(repeating: 0, count: tasks.count)
        func release(_ ts: Int) {
            while let server = busy.min, server.first <= ts {
                let server = busy.popMin()!
                idle.insert(Server(first: servers[server.second], second: server.second))
            }
        }
        for i in 0..<tasks.count {
            ts = max(ts, i)
            release(ts)
            if idle.isEmpty {
                ts = busy.min!.first
                release(ts)
            }
            let server = idle.popMin()!
            let idx = server.second
            result[i] = idx
            busy.insert(Server(first: ts + tasks[i], second: idx))
        }
        return result
    }
    
    func tests() {
        print(assignTasks([3,3,2], [1,2,3,2,1,2])) // [2,2,0,2,1,2]
        print(assignTasks([5,1,4,3,2], [2,1,2,4,5,2,1])) // [1,4,1,4,1,3,2]
    }
}
