final class NumberofUniqueXORTripletsI {
    func uniqueXorTriplets(_ nums: [Int]) -> Int {
        let n = nums.count
        guard n > 2 else { return n }
        var result = 1
        while result <= n {
            result <<= 1
        }
        return result
    }
    
    func tests() {
        print(uniqueXorTriplets([1,2])) // 2
        print(uniqueXorTriplets([3,1,2])) // 4
    }
}
