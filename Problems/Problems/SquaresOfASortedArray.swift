class SquaresOfASortedArray {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var k = 0
        var l = nums.count
        var result = Array(repeating: 0, count: l)
        var left = 0
        var right = 0
        while k < l {
            left = nums[k] * nums[k]
            right = nums[l-1] * nums[l-1]
            if left < right {
                result[l - 1 - k] = right
                l -= 1
            } else {
                result[l - 1 - k] = left
                k += 1
            }
        }
        return result
    }

    func tests() {
        print(sortedSquares([-4,-1,0,3,10])) // [0,1,9,16,100]
        print(sortedSquares([-7,-3,2,3,11])) // [4,9,9,49,121]
    }
}
