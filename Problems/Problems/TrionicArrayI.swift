final class TrionicArrayI {
    func isTrionic(_ nums: [Int]) -> Bool {
        guard nums.count > 3 else { return false }
        guard nums[0] < nums[1] else { return false }
        var count = 0
        var prev = 1
        for i in nums.indices.dropFirst() {
            let cur = (nums[i] - nums[i-1]).signum()
            guard cur != 0 else { return false }
            if cur != prev {
                count += 1
                guard count <= 2 else { return false }
                prev = cur
            }
        }
        return count == 2
    }
    
    func tests() {
        print(isTrionic([1,3,5,4,2,6])) // true
        print(isTrionic([2,1,3])) // false
    }
}
