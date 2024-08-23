//import HeapModule
class MeetingRoomsII {
//    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
//        let n = intervals.count
//        guard n > 1 else { return n }
//        let sorted = intervals.sorted { $0[0] < $1[0] }
//        var heap: HeapModule.Heap<Int> = []
//        for interval in sorted {
//            if let minEnd = heap.min, minEnd <= interval[0] {
//                heap.removeMin()
//            }
//            heap.insert(interval[1])
//        }
//        return heap.count
//    }

    func minMeetingRooms(_ intervals: [[Int]]) -> Int {
        let n = intervals.count
        guard n > 1 else { return n }
        let sorted = intervals.sorted { $0[0] < $1[0] }
        var result = 0
        var rights: [Int] = []
        for interval in sorted {
            rights = rights.filter { $0 > interval[0] }
            rights.append(interval[1])
            result = max(result, rights.count)
        }
        return result
    }
    
    func tests() {
        print(minMeetingRooms([[0,30],[5,10],[15,20]])) // 2
        print(minMeetingRooms([[7,10],[2,4]])) // 1
        print(minMeetingRooms([[5,8],[6,8]])) // 2
    }
}

