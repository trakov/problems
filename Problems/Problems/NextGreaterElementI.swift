class NextGreaterElementI {
    func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var stack: [Int] = [] // values
        var next: [Int: Int] = [:]
        for num in nums2 {
            while !stack.isEmpty && num > stack.last! {
                next[stack.last!] = num
                stack.removeLast()
            }
            stack.append(num)
        }
        var result = Array(repeating: -1, count: nums1.count)
        for (i, num) in nums1.enumerated() {
            result[i] = next[num] ?? -1
        }
        return result
    }

    func tests() {
        print(nextGreaterElement([4,1,2], [1,3,4,2])) // [-1,3,-1]
        print(nextGreaterElement([2,4], [1,2,3,4])) // [3,-1]
    }
}
