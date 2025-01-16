class BitwiseXORofAllPairings {
    func xorAllNums(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var result = 0
        if nums1.count % 2 == 1 {
            for num in nums2 {
                result ^= num
            }
        }
        if nums2.count % 2 == 1 {
            for num in nums1 {
                result ^= num
            }
        }
        return result
    }
    
    func tests() {
        print(xorAllNums([2,1,3], [10,2,5,0])) // 13
        print(xorAllNums([1,2], [3,4])) // 0
    }
}

