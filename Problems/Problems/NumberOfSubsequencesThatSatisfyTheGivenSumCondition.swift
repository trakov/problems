class NumberOfSubsequencesThatSatisfyTheGivenSumCondition {
    private let mod = 1_000_000_007
    private var powMap: [Int: Int] = [0:1]
    func pow(num: Int) -> Int {
        if powMap[num] == nil {
            powMap[num] = 2 * pow(num: num - 1) % mod
        }
        return powMap[num]!
    }
    func numSubseq(_ nums: [Int], _ target: Int) -> Int {
        var nums = nums.sorted()
        var result = 0
        var left = 0
        var right = nums.count - 1
        while left <= right {
            guard nums[left] + nums[right] <= target else {
                right -= 1
                continue
            }
            result = (result + pow(num: right - left)) % mod
            left += 1
        }
        return result % mod
    }
    
    func tests() {
        print(numSubseq([9,25,9,28,24,12,17,8,28,7,21,25,10,2,16,19,12,13,15,28,14,12,24,9,6,7,2,15,19,13,30,30,23,19,11,3,17,2,14,20,22,30,12,1,11,2,2,20,20,27,15,9,10,4,12,30,13,5,2,11,29,5,3,13,22,5,16,19,7,19,11,16,11,25,29,21,29,3,2,9,20,15,9]
                        , 32))
        print(numSubseq([27,21,14,2,15,1,19,8,12,24,21,8,12,10,11,30,15,18,28,14,26,9,2,24,23,11,7,12,9,17,30,9,28,2,14,22,19,19,27,6,15,12,29,2,30,11,20,30,21,20,2,22,6,14,13,19,21,10,18,30,2,20,28,22]
                        , 31))
        print(numSubseq([3,5,6,7], 9)) // 4
        print(numSubseq([3,3,6,8], 10)) // 6
        print(numSubseq([2,3,3,4,6,7], 12)) // 61
    }
}

