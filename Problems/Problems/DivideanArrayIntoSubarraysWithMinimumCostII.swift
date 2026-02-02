class DivideanArrayIntoSubarraysWithMinimumCostII {
    func minimumCost(_ nums: [Int], _ k: Int, _ dist: Int) -> Int {
        let n = nums.count
        let k = k - 1
        var window = [Int]()
        window.reserveCapacity(dist + 2)
        func insert(_ x: Int) {
            let i = window.binarySearchInsert(x)
            window.insert(x, at: i)
        }
        func remove(_ x: Int) {
            let i = window.binarySearchLeft(x)
            window.remove(at: i)
        }
        for i in 1...dist+1 {
            insert(nums[i])
        }
        var currentSum = window.prefix(k).reduce(0, +)
        var best = currentSum
        if dist + 2 < n {
            for i in (dist + 2)..<n {
                let newVal = nums[i]
                let outVal = nums[i - dist - 1]
                if newVal < window[k - 1] {
                    currentSum += newVal
                    currentSum -= window[k - 1]
                }
                insert(newVal)
                let idx = window.binarySearchLeft(outVal)
                if idx < k {
                    currentSum -= outVal
                    currentSum += window[k]
                }
                remove(outVal)
                best = min(best, currentSum)
            }
        }
        return nums[0] + best
    }
    
    func tests() {
        print(minimumCost([1,3,2,6,4,2], 3, 3)) // 5
        print(minimumCost([10,1,2,2,2,1], 4, 3)) // 15
        print(minimumCost([10,8,18,9], 3, 1)) // 36
    }
}

extension Array where Element == Int {
    func binarySearchLeft(_ x: Int) -> Int {
        var l = 0, r = count
        while l < r {
            let m = (l + r) >> 1
            if self[m] < x { l = m + 1 }
            else { r = m }
        }
        return l
    }

    func binarySearchInsert(_ x: Int) -> Int {
        var l = 0, r = count
        while l < r {
            let m = (l + r) >> 1
            if self[m] <= x { l = m + 1 }
            else { r = m }
        }
        return l
    }
}
