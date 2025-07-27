final class CountHillsandValleysinanArray {
    func countHillValley(_ nums: [Int]) -> Int {
        var (a, b) = (-1, -1)
        var result = 0
        for num in nums {
            if a == -1 {
                a = num
            } else if b == -1 {
                if num != a {
                    b = num
                }
            } else if b != num {
                if (a < b && num < b) || (a > b && num > b) {
                    result += 1
                }
                (a, b) = (b, num)
            }
        }
        return result
    }
    
    func tests() {
        print(countHillValley([2,4,1,1,6,5])) // 3
        print(countHillValley([6,6,5,5,4,1])) // 0
    }
}
