class ShuffleTheArray {
    func shuffle(_ nums: [Int], _ n: Int) -> [Int] {
        guard n > 1 else { return nums }
        var result: [Int] = Array(repeating: 0, count: 2*n)
        for i in 0..<n {
            result[2 * i] = nums[i]
            result[2 * i + 1] = nums[i + n]
        }
        return result
    }

    func tests() {
        print(shuffle([2,5,1,3,4,7], 3)) // [2,3,5,4,1,7]
        print(shuffle([1,2,3,4,4,3,2,1], 4)) // [1,4,2,3,3,2,4,1]
        print(shuffle([1,1,2,2], 2)) // [1,2,1,2]
    }
}
