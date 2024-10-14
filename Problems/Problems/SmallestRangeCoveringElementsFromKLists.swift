class SmallestRangeCoveringElementsFromKLists {
    func smallestRange(_ nums: [[Int]]) -> [Int] {
        var numsTuples: [(Int, Int)] = []
        for (index, num)  in nums.enumerated() {
            num.forEach {
                numsTuples.append((index, $0))
            }
        }
        let sorted = numsTuples.sorted(by: { $0.1 < $1.1 })
        let groups = sorted.map { $0.0 }
        
        // Second step - find answer using Sliding Window
        let n = nums.count
        
        var left = 0
        var seen = Array(repeating: 0, count: n)
        var seenCount = 0
        
        var answer = [sorted.first!.1, sorted.last!.1]
        
        for (ind, g) in groups.enumerated() {
            seen[g] += 1
            if seen[g] == 1 { seenCount += 1 }
            
            // Move left pointer to get the smallest range
            while seenCount == n && seen[groups[left]] > 1 {
                seen[groups[left]] -= 1
                left += 1
            }
            
            // If range contains all groups and the range is smaller than current answer, reset answer
            if seenCount == n && answer.last! - answer.first! > sorted[ind].1 - sorted[left].1 {
                answer = [sorted[left].1, sorted[ind].1]
            }
        }
        
        return answer
    }
    
    func tests() {
        print(smallestRange([[4,10,15,24,26],[0,9,12,20],[5,18,22,30]])) // [20,24]
        print(smallestRange([[1,2,3],[1,2,3],[1,2,3]])) // [1,1]
    }
}

