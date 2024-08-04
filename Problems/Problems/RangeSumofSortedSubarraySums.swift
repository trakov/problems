class RangeSumofSortedSubarraySums {
    func rangeSum(_ nums: [Int], _ n: Int, _ left: Int, _ right: Int) -> Int {
        let mod = 1_000_000_007
        var sum = 0
        let prefixes = nums.map {
            sum += $0
            return sum
        }
        var sums: [Int] = prefixes
        var leftSum = nums[0]
        for (i, num) in nums.enumerated().dropFirst() {
            for j in i..<n {
                sums.append(prefixes[j] - leftSum)
            }
            leftSum += num
        }
        sums.sort()
        sum = 0
        for i in left...right {
            sum = (sum + sums[i - 1]) % mod
        }
        return sum
    }
    
    func tests() {
        print(rangeSum([1,2,3,4], 4, 1, 5)) // 13
        print(rangeSum([1,2,3,4], 4, 3, 4)) // 6
        print(rangeSum([1,2,3,4], 4, 1, 10)) // 50
    }
}

