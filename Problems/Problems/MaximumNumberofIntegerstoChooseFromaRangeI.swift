class MaximumNumberofIntegerstoChooseFromaRangeI {
    func maxCount(_ banned: [Int], _ n: Int, _ maxSum: Int) -> Int {
        let banned = Set(banned)
        var result = 0
        var sum = 0
        for i in 1...n where !banned.contains(i) {
            guard sum + i <= maxSum else { break }
            sum += i
            result += 1
        }
        return result
    }
    
    func tests() {
        print(maxCount([1,6,5], 5, 6)) // 2
        print(maxCount([1,2,3,4,5,6,7], 8, 1)) // 0
        print(maxCount([11], 7, 50)) // 7
    }
}

