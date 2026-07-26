final class MaximumProductofThreeNumbers {
    func maximumProduct(_ nums: [Int]) -> Int {
        var (min1, min2, min3) = (Int.max, Int.max, Int.max)
        var (max1, max2, max3) = (Int.min, Int.min, Int.min)
        var hasZero = false
        for num in nums {
            hasZero = hasZero || num == 0
            if num < min1 {
                (min3, min2, min1) = (min2, min1, num)
            } else if num < min2 {
                (min3, min2) = (min2, num)
            } else if num < min3 {
                min3 = num
            }
            if num > max1 {
                (max3, max2, max1) = (max2, max1, num)
            } else if num > max2 {
                (max3, max2) = (max2, num)
            } else if num > max3 {
                max3 = num
            }
        }
        return max(
            hasZero ? 0 : Int.min,
            max1 * max2 * max3,
            min1 * min2 * max1
        )
    }
    
    func tests() {
        print(maximumProduct([1,2,3])) // 6
        print(maximumProduct([1,2,3,4])) // 24
        print(maximumProduct([-1,-2,-3])) // -6
    }
}
