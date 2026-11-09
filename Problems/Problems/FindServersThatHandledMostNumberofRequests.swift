import HeapModule
final class FindServersThatHandledMostNumberofRequests {
    struct Job: Comparable {
        let at: Int
        let server: Int

        static func < (lhs: Job, rhs: Job) -> Bool {
            lhs.at < rhs.at
        }
    }

    func busiestServers(_ k: Int, _ arrival: [Int], _ load: [Int]) -> [Int] {
        var free = HeapModule.Heap<Int>()
        for x in 0..<k {
            free.insert(x)
        }

        var busy = HeapModule.Heap<Job>()
        var handled = [Int](repeating: 0, count: k)

        for i in 0..<arrival.count {
            while let job = busy.min, job.at <= arrival[i] {
                _ = busy.popMin()
                let x = job.server
                free.insert(i + ((x - i) % k + k) % k)
            }

            guard let next = free.popMin() else { continue }
            let x = next % k

            busy.insert(Job(at: arrival[i] + load[i], server: x))
            handled[x] += 1
        }

        let most = handled.max()!
        return (0..<k).filter { handled[$0] == most }
    }
    
    func tests() {
        print(busiestServers(3, [1,2,3,4,5], [5,2,3,3,3])) // [1]
        print(busiestServers(3, [1,2,3,4], [1,2,1,2])) // [0]
        print(busiestServers(3, [1,2,3], [10,12,11])) // [0,1,2]
    }
}
