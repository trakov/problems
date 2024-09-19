class KthLargestElementInAnArray {
    class Heap<T: Comparable> {
        let comp: ((T, T) -> Bool)
        private var arr: [T] = []

        var isEmpty: Bool {
            arr.isEmpty
        }

        var count: Int {
            arr.count
        }

        var top: T? {
            arr.first
        }

        init(_ comp: @escaping ((T, T) -> Bool)) {
            self.comp = comp
        }

        @discardableResult
        func pop() -> T? {
            guard let res = top else { return nil }
            guard count > 1 else { return arr.removeLast() }
            arr[0] = arr[count - 1]
            var i = 0
            while 2 * i + 1 < count - 1 {
                let index = comp(arr[2*i+1], arr[2*i+2]) ? 2*i+1 : 2*i+2
                if comp(arr[index], arr[i]) {
                    arr.swapAt(i, index)
                    i = index
                } else {
                    break
                }
            }
            arr.removeLast()
            return res
        }

        func insert(_ el: T) {
            arr.append(el)
            var i = count - 1
            while i > 0 && comp(arr[i], arr[(i - 1) / 2]) {
                arr.swapAt(i, (i - 1) / 2)
                i = (i - 1) / 2
            }
        }
    }
    
    // min heap
    func findKthLargest1(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        guard k <= n else { return 0 }
        let heap = Heap<Int>(<)
        for num in nums {
            heap.insert(num)
            if heap.count > k {
                heap.pop()
            }
        }
        return heap.top!
    }

    // counting sort
    func findKthLargest2(_ nums: [Int], _ k: Int) -> Int {
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
    
    // quick select
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        func quickSelect(_ nums: [Int], _ k: Int) -> Int {
            let pivotIndex = Int.random(in: (0..<nums.count))
            let pivot = nums[pivotIndex]
            var left: [Int] = []
            var mid: [Int] = []
            var right: [Int] = []
            for num in nums {
                if num > pivot {
                    left.append(num)
                } else if num < pivot {
                    right.append(num)
                } else {
                    mid.append(num)
                }
            }
            if k <= left.count {
                return quickSelect(left, k)
            }
            if left.count + mid.count < k {
                return quickSelect(right, k - left.count - mid.count)
            }
            return pivot
        }
        return quickSelect(nums, k)
    }

    func tests() {
        print(findKthLargest([3,2,1,5,6,4], 2)) // 5
        print(findKthLargest([3,2,3,1,2,4,5,5,6], 4)) // 4
    }
}

