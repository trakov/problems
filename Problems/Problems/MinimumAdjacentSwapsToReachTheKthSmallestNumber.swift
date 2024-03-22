class MinimumAdjacentSwapsToReachTheKthSmallestNumber {
    func getMinSwaps(_ num: String, _ k: Int) -> Int {
        let nums = num.map { Int(String($0))! }
        let n = nums.count
        var permutation = nums
        var result = 0
        for i in 0..<k {
            nextPermutation(&permutation)
        }
        var j = 0
        for i in 0..<n {
            j = i
            while permutation[j] != nums[i] {
                j += 1
            }
            while i < j {
                permutation.swapAt(j, j - 1)
                j -= 1
                result += 1
            }
        }
        return result
    }
    
    func nextPermutation(_ nums: inout [Int]) {
        let n = nums.count
        guard n > 2 else { nums.reverse(); return }
        var pos: Int?
        for (i, num) in nums.enumerated().reversed().dropFirst() {
            if num < nums[i + 1] {
                pos = i
                break
            }
        }
        guard let pos = pos else { nums.reverse(); return }
        var temp: Int?
        for i in (pos+1)..<n {
            if nums[i] <= nums[pos] {
                temp = i - 1
                break
            }
        }
        let pos2 = temp ?? (n - 1)
        nums.swapAt(pos, pos2)
        var left = pos + 1
        var right = n - 1
        while left < right {
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }
    }

    func tests() {
        print(getMinSwaps("5489355142", 4)) // 2
        print(getMinSwaps("11112", 4)) // 4
        print(getMinSwaps("00123", 1)) // 1
    }
}

