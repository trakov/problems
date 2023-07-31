class MinimumJumpsToReachHome {
    func minimumJumps(_ forbidden: [Int], _ a: Int, _ b: Int, _ x: Int) -> Int {
        guard x != 0 else { return 0 }
        var forbidden = Set(forbidden)
        forbidden.insert(0)
        var count = 1
        var queue = [(0, true)]
        let maxValue = max(forbidden.max()! + a + b, x + b)
        while !queue.isEmpty {
            var nextQueue: [(Int, Bool)] = []
            for (place, isForward) in queue {
                if isForward {
                    let jump = place - b
                    if jump > 0 && !forbidden.contains(jump) {
                        if jump == x { return count }
                        nextQueue.append((jump, false))
                        forbidden.insert(jump)
                    }
                }
                let jump = place + a
                if !forbidden.contains(jump) && jump <= maxValue {
                    if jump == x { return count }
                    nextQueue.append((jump, true))
                    forbidden.insert(jump)
                }
            }
            count += 1
            queue = nextQueue
        }
        
        return -1
    }
    
    func tests() {
        print(minimumJumps([14,4,18,1,15], 3, 15, 9)) // 3
        print(minimumJumps([8,3,16,6,12,20], 15, 13, 11)) // -1
        print(minimumJumps([1,6,2,14,5,17,4], 16, 9, 7)) // 2
    }
}

