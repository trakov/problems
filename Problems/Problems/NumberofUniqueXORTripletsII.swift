final class NumberofUniqueXORTripletsII {
    func uniqueXorTriplets(_ nums: [Int]) -> Int {
        let m = nums.max()!
        var u = 1
        while u <= m {
            u <<= 1
        }
        var one = Array(repeating: false, count: u)
        var two = Array(repeating: false, count: u)
        var three = Array(repeating: false, count: u)
        for v in nums {
            one[v] = true
            for x in 0..<u where one[x] {
                two[x ^ v] = true
            }
        }
        for v in nums {
            for x in 0..<u where two[x] {
                three[x ^ v] = true
            }
        }
        var result = 0
        for b in three where b {
            result += 1
        }
        return result
    }
    
    func tests() {
        print(uniqueXorTriplets([1,3])) // 2
        print(uniqueXorTriplets([6,7,8,9])) // 4
    }
}
