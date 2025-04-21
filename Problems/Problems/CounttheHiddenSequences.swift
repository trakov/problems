final class CounttheHiddenSequences {
    func numberOfArrays(_ differences: [Int], _ lower: Int, _ upper: Int) -> Int {
        var (a, b, num) = (0, 0, 0)
        for diff in differences {
            num += diff
            a = min(a, num)
            b = max(b, num)
        }
        return max((upper - lower) - (b - a) + 1, 0)
    }
    
    func tests() {
        print(numberOfArrays([1,-3,4], 1, 6)) // 2
        print(numberOfArrays([3,-4,5,1,-2], -4, 5)) // 4
        print(numberOfArrays([4,-7,2], 3, 6)) // 0
    }
}
