final class FindtheMaximumLengthofValidSubsequenceI {
    func maximumLength(_ nums: [Int]) -> Int {
        var (flip, odd, even) = (0, 0, 0)
        var last = -1
        for num in nums {
            (odd, even) = (odd + num % 2, even + 1 - num % 2)
            if last == -1 || last != num % 2 {
                last = num % 2
                flip += 1
            }
        }
        return max(flip, odd, even)
    }
    
    func tests() {
        print(maximumLength([1,2,3,4])) // 4
        print(maximumLength([1,2,1,1,2,1,2])) // 6
        print(maximumLength([1,3])) // 2
    }
}
