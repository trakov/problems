class TotalCostToHireKWorkers {
    func totalCost(_ costs: [Int], _ k: Int, _ candidates: Int) -> Int {
        let n = costs.count
        guard candidates * 2 + k <= n else {
            return costs.sorted().prefix(k).reduce(0, +)
        }
        var leftHeap = Heap(array: Array(costs.prefix(candidates)), sort: <)
        var rightHeap = Heap(array: Array(costs.suffix(candidates)), sort: <)
        var result = 0
        var leftIndex = candidates
        var rightIndex = n - candidates - 1
        for _ in 0..<k {
            if leftHeap.peek()! <= rightHeap.peek()! {
                result += leftHeap.remove()!
                leftHeap.insert(costs[leftIndex])
                leftIndex += 1
            } else {
                result += rightHeap.remove()!
                rightHeap.insert(costs[rightIndex])
                rightIndex -= 1
            }
        }
        
        return result
    }
    
    func tests() {
        print(totalCost([2,1,2], 1, 1)) // 2
        print(totalCost([17,12,10,2,7,2,11,20,8], 3, 5)) // 11
        print(totalCost([17,12,10,2,7,2,11,20,8], 3, 4)) // 11
        print(totalCost([1,2,4,1], 3, 3)) // 4
        print(totalCost([3,2,7,7,1,2], 2, 2)) // 3
        print(totalCost([3,2,1,7,7,1,2], 2, 2)) // 3
        print(totalCost([3,2,1,7,1,1,1,7,1,2], 3, 3)) // 3
    }
}

