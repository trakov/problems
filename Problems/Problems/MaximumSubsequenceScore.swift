class MaximumSubsequenceScore {
    func maxScore(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
        let n = nums1.count
        let sorted = zip(nums1, nums2).sorted { p1, p2 in
            return p1.1 >= p2.1
        }
        var sum = 0
        var nums = Array(repeating: 0, count: k)
        for i in 0..<k {
            sum += sorted[i].0
            nums[i] = sorted[i].0
        }
        var minMult = sorted[k-1].1
        var result = sum * minMult
        guard k != n else { return result }
        nums.sort(by: >)
        for i in k..<n {
            guard sorted[i].0 > nums.last! else { continue }
            sum -= nums.removeLast()
            sum += sorted[i].0
            nums.append(sorted[i].0)
            nums.sort(by: >)
            minMult = sorted[i].1
            result = max(result, sum * minMult)
        }
        return result
    }
    
    func tests() {
        print(maxScore([1,3,3,2], [2,1,3,4], 3)) // 12
        print(maxScore([4,2,3,1,1], [7,5,10,9,6], 1)) // 30
    }
}

