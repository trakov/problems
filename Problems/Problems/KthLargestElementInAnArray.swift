class KthLargestElementInAnArray {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        nums.sorted()[nums.count - k]
    }
    
    func tests() {
        print(findKthLargest([3,2,1,5,6,4], 2)) // 5
        print(findKthLargest([3,2,3,1,2,4,5,5,6], 4)) // 4
    }
}

