final class FindSubsequenceofLengthKWiththeLargestSum {
    func maxSubsequence(_ nums: [Int], _ k: Int) -> [Int] {
        let maxK = nums.sorted().suffix(k)
        var map: [Int: Int] = [:]
        for num in maxK {
            map[num, default: 0] += 1
        }
        var result: [Int] = []
        for num in nums {
            guard let count = map[num], count > 0 else { continue }
            result.append(num)
            map[num] = count - 1
        }
        return result
    }
    
    func tests() {
        print(maxSubsequence([2,1,3,3], 2)) // [3,3]
        print(maxSubsequence([-1,-2,3,4], 3)) // [-1,3,4]
        print(maxSubsequence([3,4,3,3], 2)) // [3,4]
    }
}
