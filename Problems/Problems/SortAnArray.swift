class SortAnArray {
    func sortArray(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else { return nums }
        var nums = nums
        heapSort(&nums)
        return nums
    }

    func heapSort(_ arr: inout [Int]) {
        let n = arr.count
  
        // Build heap (rearrange array)
        for i in (0...(n / 2 - 1)).reversed() {
            heapify(arr: &arr, n: n, i: i)
        }
        // One by one extract an element from heap
        for i in (1...n - 1).reversed() {
            // Move current root to end
            arr.swapAt(0, i)
            // call max heapify on the reduced heap
            heapify(arr: &arr, n: i, i: 0)
        }
    }
  
    // To heapify a subtree rooted with node i which is
    // an index in arr[]. n is size of heap
    func heapify(arr: inout [Int], n: Int, i: Int) {
        var largest = i // Initialize largest as root
        let l = 2 * i + 1 // left = 2*i + 1
        let r = 2 * i + 2 // right = 2*i + 2
  
        // If left child is larger than root
        if l < n && arr[l] > arr[largest] {
            largest = l
        }
        // If right child is larger than largest so far
        if r < n && arr[r] > arr[largest] {
            largest = r
        }
        // If largest is not root
        if largest != i {
            arr.swapAt(i, largest)
            // Recursively heapify the affected sub-tree
            heapify(arr: &arr, n: n, i: largest)
        }
    }

    func tests() {
        print(sortArray([5,2,3,1])) // [1,2,3,5]
        print(sortArray([5,1,1,2,0,0])) // [0,0,1,1,2,5]
    }
}
