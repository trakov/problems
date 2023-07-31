class LastStoneWeight {
    func lastStoneWeight(_ stones: [Int]) -> Int {
        var heap = Heap(array: stones, sort: >)
        
        while heap.count > 1 {
            let s1 = heap.remove()!
            let s2 = heap.remove()!
            if s1 == s2 {
                continue
            } else {
                heap.insert(s1 - s2)
            }
        }
        return heap.peek() ?? 0
    }

    func lastStoneWeight2(_ stones: [Int]) -> Int {
        var stones = stones.sorted()
        
        while stones.count > 1 {
            let s1 = stones.removeLast()
            let s2 = stones.removeLast()
            if s1 == s2 {
                continue
            } else {
                stones.append(s1 - s2)
                stones.sort()
            }
        }
        return stones.last ?? 0
    }

    func tests() {
        print(lastStoneWeight([2,7,4,1,8,1])) // 1
        print(lastStoneWeight([1])) // 1
    }
}
