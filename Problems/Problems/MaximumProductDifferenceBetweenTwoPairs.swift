class MaximumProductDifferenceBetweenTwoPairs {
    func maxProductDifference(_ nums: [Int]) -> Int {
        var min1 = Int.max
        var min2 = Int.max
        var max1 = 0
        var max2 = 0
        for num in nums {
            if num < min1 {
                (min1, min2) = (num, min1)
            } else {
                min2 = min(min2, num)
            }
            if num > max2 {
                (max1, max2) = (max2, num)
            } else {
                max1 = max(max1, num)
            }
        }
        return max1 * max2 - min1 * min2
    }
    
    func tests() {
        print(maxProductDifference([5,6,2,7,4])) // 34
        print(maxProductDifference([4,2,5,9,7,4,8])) // 64
    }
}

