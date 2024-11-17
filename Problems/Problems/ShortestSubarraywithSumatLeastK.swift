class ShortestSubarraywithSumatLeastK {
    func shortestSubarray(_ nums: [Int], _ k: Int) -> Int {
        var prefixSum = Array(repeating: 0, count: nums.count + 1)
        for i in 0..<nums.count {
            prefixSum[i+1] = prefixSum[i] + nums[i]
        }

        var shortestLength = Int.max
        var minQueue: [Int] = []
        var start = 0

        for right in 0..<prefixSum.count {
            while start < minQueue.count && prefixSum[minQueue.last!] > prefixSum[right] {
                minQueue.removeLast()
            }
            minQueue.append(right)

            while start < minQueue.count && prefixSum[right] - prefixSum[minQueue[start]] >= k {
                shortestLength = min(shortestLength, right - minQueue[start])
                start += 1
            }
        }
        return shortestLength == Int.max ? -1 : shortestLength
    }
    
    func tests() {
        print(shortestSubarray([1], 1)) // 1
        print(shortestSubarray([1,2], 4)) // -1
        print(shortestSubarray([2,-1,2], 3)) // 3
    }
}

