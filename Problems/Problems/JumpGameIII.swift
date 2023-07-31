class JumpGameIII {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        guard arr[start] != 0 else { return true }
        guard arr.contains(0) else { return false }
        var arr = arr // to track visited with -1
        var queue = [start]
        while !queue.isEmpty {
            var nextQueue: [Int] = []
            for q in queue where arr[q] != -1 {
                if arr[q] == 0 { return true }
                if q + arr[q] < arr.count {
                    nextQueue.append(q + arr[q])
                }
                if q - arr[q] >= 0 {
                    nextQueue.append(q - arr[q])
                }
                arr[q] = -1
            }
            queue = nextQueue
        }
        return false
    }
    
    func tests() {
        print(canReach([4,2,3,0,3,1,2], 5)) // true
        print(canReach([4,2,3,0,3,1,2], 0)) // true
        print(canReach([3,0,2,1,2], 2)) // false
    }
}

