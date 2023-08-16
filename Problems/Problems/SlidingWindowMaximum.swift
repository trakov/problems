class SlidingWindowMaximum {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        let deque = Deque(k)
        var results: [Int] = []
        for i in 0..<nums.count {
            let num = nums[i]
            // Remove elements from the right of the deque that
            // are smaller than the current number.
            while !deque.isEmpty && deque.right < num {
                deque.removeRight()
            }
            deque.insertRight(num)

            // When `k` elements added window has the needed width.
            if i >= k - 1 {
                // The left of the deque holds the maximum for the current window.
                results.append(deque.left)
                if deque.left == nums[i + 1 - k] {
                    deque.removeLeft()
                }
            }
        }
        return results
    }
    
    func maxSlidingWindow1(_ nums: [Int], _ k: Int) -> [Int] {
        guard k > 1 else { return nums }
        let n = nums.count
        var deque: [Int] = [] // track indices
        var result = Array(repeating: 0, count: n - k + 1)
        var j = 0
        // for each value - O(n)
        for i in 0..<n {
            // 1. Discard all values smaller than the new value
            // O(k), but max n total times, thus still O(n) overall
            while !deque.isEmpty && nums[deque.last!] < nums[i] {
                deque.removeLast()
            }
            
            // 2. Discard first item, if its now out of the window
            if !deque.isEmpty && deque.first! + k == i {
                deque.removeFirst()
            }
            
            // 3. Append new value
            deque.append(i)
            
            // if in full first window
            if i >= k - 1 {
                // 4. Store max for current window (first is always max due to 1.)
                result[j] = nums[deque.first!]
                j += 1
            }
        }

        return result
    }

    func maxSlidingWindow0(_ nums: [Int], _ k: Int) -> [Int] {
        guard k > 1 else { return nums }
        let n = nums.count
        var left = Array(repeating: 0, count: n)
        var right = Array(repeating: 0, count: n)
        left[0] = nums[0]
        right[n - 1] = nums[n - 1]
        
        for i in 1..<n {
            if i % k == 0 {
                left[i] = nums[i]
            } else {
                left[i] = max(left[i - 1], nums[i])
            }

            let j = n - i - 1
            if (j + 1) % k == 0 {
                right[j] = nums[j]
            } else {
                right[j] = max(right[j + 1], nums[j])
            }
        }
        
        return (0..<n-k+1).map { i in
            max(left[i + k - 1], right[i])
        }
    }
    
    func maxSlidingWindow2(_ nums: [Int], _ k: Int) -> [Int] {
        guard k > 1 else { return nums }
        var result = Array(repeating: 0, count: nums.count - k + 1)
        var sorted = Array(nums[0..<k].sorted())
        
        func binary(isInsert: Bool = true, num: Int) {
            var left = 0
            var right = sorted.count - 1
            while left <= right {
                let mid = (left + right) / 2
                if sorted[mid] > num {
                    right = mid - 1
                } else if sorted[mid] < num {
                    left = mid + 1
                } else {
                    left = mid
                    break
                }
            }
            if isInsert {
                sorted.insert(num, at: left)
            } else {
                sorted.remove(at: left)
            }
        }
        
        for i in 0..<result.count {
            result[i] = sorted.last!
            guard i < result.count - 1 else { break }
            binary(isInsert: false, num: nums[i])
            binary(num: nums[i + k])
        }
        
        return result
    }

    func tests() {
        print(maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3)) // [3,3,5,5,6,7]
        print(maxSlidingWindow([1], 1)) // [1]
    }
}

class Deque {
    private var storage: [Int]
    private var head = 0
    private var length = 0
    var left: Int {
        storage[head]
    }
    var right: Int {
        storage[(head + length - 1) % storage.count]
    }
    var isEmpty: Bool {
        length == 0
    }
    init(_ size: Int) {
        storage = Array(repeating: 0, count: size)
    }
    func insertRight(_ element: Int) {
        storage[(head + length) % storage.count] = element
        length += 1
    }
    func removeLeft() {
        head = (head + 1) % storage.count
        length -= 1
    }
    func removeRight() {
        length -= 1
    }
}
