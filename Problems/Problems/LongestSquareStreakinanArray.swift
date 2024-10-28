class LongestSquareStreakinanArray {
    func longestSquareStreak(_ nums: [Int]) -> Int {
        var result = 0
        let set = Set(nums)
        for num in nums {
            var cur = 0
            var num = num
            while set.contains(num) {
                cur += 1
                if num * num > 100_000 { break }
                num *= num
            }
            result = max(result, cur)
        }
        return result < 2 ? -1 : result
    }
    
    func tests() {
        print(longestSquareStreak([4,3,6,16,8,2])) // 3
        print(longestSquareStreak([2,3,5,6,7])) // -1
    }
}

