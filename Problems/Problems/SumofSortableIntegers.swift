final class SumofSortableIntegers {
    func sortableIntegers(_ nums: [Int]) -> Int {
        func check(_ nums1: [Int], _ nums2: [Int]) -> Bool {
            let L = nums1.count
            for i in 0..<(L - 1) {
                if nums1[i] > nums1[i + 1] {
                    let rotated = Array(nums1[(i + 1)...]) + Array(nums1[...i])
                    return rotated == nums2
                }
            }
            return nums1 == nums2
        }
        let n = nums.count
        var fac = [Int]()
        for x in 1...Int(Double(n).squareRoot()) {
            if n % x == 0 {
                fac.append(x)
                if n / x != x {
                    fac.append(n / x)
                }
            }
        }
        let target = nums.sorted()
        var ans = 0
        for d in fac {
            var allGood = true
            for left in stride(from: 0, to: n, by: d) {
                let right = left + d
                let sub1 = Array(nums[left..<right])
                let sub2 = Array(target[left..<right])
                if !check(sub1, sub2) {
                    allGood = false
                    break
                }
            }
            if allGood {
                ans += d
            }
        }
        return ans
    }

    func tests() {
        print(sortableIntegers([3,1,2])) // 3
        print(sortableIntegers([7,6,5])) // 0
        print(sortableIntegers([5,8])) // 3
    }
}
