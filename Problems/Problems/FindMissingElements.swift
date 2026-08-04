final class FindMissingElements {
    func findMissingElements(_ nums: [Int]) -> [Int] {
        let nums = Set(nums)
        var (mi, ma) = (Int.max, Int.min)
        for num in nums {
            mi = min(mi, num)
            ma = max(ma, num)
        }
        var result: [Int] = []
        for num in mi...ma where !nums.contains(num) {
            result.append(num)
        }
        return result
    }
    
    func tests() {
        print(findMissingElements([1,4,2,5])) // [3]
        print(findMissingElements([7,8,6,9])) // []
        print(findMissingElements([5,1])) // [2,3,4]
    }
}
