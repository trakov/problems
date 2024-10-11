//import HeapModule

class TheNumberoftheSmallestUnoccupiedChair {
    struct LeaveChair: Comparable {
        let leaving: Int
        let chair: Int
        init(_ leaving: Int, _ chair: Int) {
            self.leaving = leaving
            self.chair = chair
        }
        static func < (lhs: LeaveChair, rhs: LeaveChair) -> Bool {
            lhs.leaving < rhs.leaving
        }
    }
    
    func smallestChair(_ times: [[Int]], _ targetFriend: Int) -> Int {
        let arrival = times[targetFriend][0]
        let times = times
            .filter { $0[0] <= arrival }
            .sorted { $0[0] < $1[0] }
        let n = times.count
        var chairHeap = Heap<Int>(sort: <)
        var leavingHeap = Heap<LeaveChair>(sort: <)
        for chair in 0..<n {
            chairHeap.insert(chair)
        }
        for (i, time) in times.enumerated() {
            while leavingHeap.peek()?.leaving ?? Int.max <= time[0], let chair = leavingHeap.peek()?.chair {
                chairHeap.insert(chair)
            }
            if let chair = chairHeap.remove() {
                if time[0] == arrival {
                    return chair
                }
                leavingHeap.insert(LeaveChair(time[1], chair))
            }
        }
        return -1
    }
    
    func tests() {
        print(smallestChair([[1,4],[2,3],[4,6]], 1)) // 1
        print(smallestChair([[3,10],[1,5],[2,6]], 0)) // 2
    }
}

