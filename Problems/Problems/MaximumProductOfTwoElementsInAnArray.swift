class MaximumProductOfTwoElementsInAnArray {
    func maxProduct(_ nums: [Int]) -> Int {
        var n = 0
        var m = 0
        for num in nums {
            if num >= n {
                m = n
                n = num
            } else {
                m = max(m, num)
            }
        }
        return (n - 1) * (m - 1)
    }
    
    func tests() {
        print(maxProduct([3,4,5,2])) // 12
        print(maxProduct([1,5,4,5])) // 16
        print(maxProduct([3,7])) // 12
        print(maxProduct([3,3,4,4])) // 9
        print(maxProduct([3,3])) // 4
        print(maxProduct([3,7])) // 12
    }
}

