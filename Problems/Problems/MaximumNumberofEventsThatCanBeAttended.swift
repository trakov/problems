//import HeapModule
class MaximumNumberofEventsThatCanBeAttended {
//    func maxEvents(_ events: [[Int]]) -> Int {
//        guard events.count > 1 else { return events.count }
//        let sorted = events.sorted { $0[0] < $1[0] }
//        var heap = Heap<Int>() // min heap
//        let n = events.count
//        var i = 0
//        var day = 0
//        var result = 0
//        while !heap.isEmpty || i < n {
//            if heap.isEmpty {
//                day = sorted[i][0]
//            }
//            while i < n && sorted[i][0] <= day {
//                heap.insert(sorted[i][1])
//                i += 1
//            }
//            heap.removeMin()
//            result += 1
//            day += 1
//            while !heap.isEmpty && heap.min! < day {
//                heap.removeMin()
//            }
//        }
//        return result
//    }

    func maxEvents(_ events: [[Int]]) -> Int {
        guard events.count > 1 else { return events.count }
        let sorted = events.sorted { $0[0] < $1[0] }
        var heap = Heap<Int>(sort: >) // min heap
        let n = events.count
        var i = 0
        var day = 0
        var result = 0
        while !heap.isEmpty || i < n {
            if heap.isEmpty {
                day = sorted[i][0]
            }
            while i < n && events[i][0] <= day {
                heap.insert(events[i][1])
                i += 1
            }
            heap.remove()
            result += 1
            day += 1
            while !heap.isEmpty && heap.peek()! < day {
                heap.remove()
            }
        }
        return result
    }

    // TLE
    func maxEvents2(_ events: [[Int]]) -> Int {
        guard events.count > 1 else { return events.count }
        let sorted = events.sorted {
            if $0[1] == $1[1] {
                return $0[0] < $1[0]
            } else {
                return $0[1] < $1[1]
            }
        }
        var result: Set<Int> = [] // set of timestamps of participated events
        for event in sorted {
            let start = event[0]
            let end = event[1]
            var i = start
            while result.contains(i) && i <= end {
                i += 1
            }
            if !result.contains(i) && i <= end {
                result.insert(i)
            }
        }
        return result.count
    }
    
    func tests() {
        print(maxEvents([[1,2],[2,3],[3,4]])) // 3
        print(maxEvents([[1,2],[2,3],[3,4],[1,2]])) // 4
        print(maxEvents([[1,2],[1,2],[1,5],[1,5],[3,3]])) // 5
        print(maxEvents([[1,5],[1,5],[1,5],[2,3],[2,3]])) // 5
    }
}

