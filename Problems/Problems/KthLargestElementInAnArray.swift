class KthLargestElementInAnArray {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        countingSortSolution(nums, k)
//        nums.sorted()[nums.count - k]
    }
    
    func countingSortSolution(_ nums: [Int], _ k: Int) -> Int {
        var minValue = Int.max
        var maxValue = Int.min
        
        for num in nums {
            minValue = min(minValue, num)
            maxValue = max(maxValue, num)
        }
        
        var count = Array(repeating: 0, count: maxValue - minValue + 1)
        for num in nums {
            count[num - minValue] += 1
        }
        
        var remain = k
        for i in (0..<count.count).reversed() {
            remain -= count[i]
            if remain <= 0 {
                return i + minValue
            }
        }
        
        return -1
    }
    
    func tests() {
        print(findKthLargest([3,2,1,5,6,4], 2)) // 5
        print(findKthLargest([3,2,3,1,2,4,5,5,6], 4)) // 4
    }
}

