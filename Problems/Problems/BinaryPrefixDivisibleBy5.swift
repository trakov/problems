final class BinaryPrefixDivisibleBy5 {
    func prefixesDivBy5(_ nums: [Int]) -> [Bool] {
        var result = Array(repeating: false, count: nums.count)
        var num = 0
        for (i, d) in nums.enumerated() {
            num = (num * 2 + d) % 5
            if num == 0 {
                result[i] = true
            }
        }
        return result
    }
    
    func tests() {
        print(prefixesDivBy5([0,1,1])) // [true,false,false]
        print(prefixesDivBy5([1,1,1])) // [false,false,false]
        print(prefixesDivBy5([1,0,1,1,1,1,0,0,0,0,1,0,0,0,0,0,1,0,0,1,1,1,1,1,0,0,0,0,1,1,1,0,0,0,0,0,1,0,0,0,1,0,0,1,1,1,1,1,1,0,1,1,0,1,0,0,0,0,0,0,1,0,1,1,1,0,0,1,0]))
    }
}
