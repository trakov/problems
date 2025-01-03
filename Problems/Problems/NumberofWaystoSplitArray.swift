class NumberofWaystoSplitArray {
    func waysToSplitArray(_ nums: [Int]) -> Int {
        var result = 0
        var right = 0
        var sum = nums.reduce(0, +)
        for num in nums.dropFirst().reversed() {
            sum -= num
            right += num
            if sum >= right { result += 1 }
        }
        return result
    }
    
    func tests() {
        print(waysToSplitArray([10,4,-8,7])) // 2
        print(waysToSplitArray([2,3,1,0])) // 2
    }
}

