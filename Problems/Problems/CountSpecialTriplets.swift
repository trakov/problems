final class CountSpecialTriplets {
    func specialTriplets(_ nums: [Int]) -> Int {
        let mod = 1_000_000_007
        var last: [Int: Int] = [:]
        var first: [Int: Int] = [:]
        for num in nums {
            last[num, default: 0] += 1
        }
        var result = 0
        for num in nums {
            let target = num * 2
            let left = first[target, default: 0]
            first[num, default: 0] += 1
            let right = last[target, default: 0] - first[target, default: 0]
            result = (result + left * right) % mod
        }
        return result
    }
    
    func tests() {
        print(specialTriplets([6,3,6])) // 1
        print(specialTriplets([0,1,0,0])) // 1
        print(specialTriplets([8,4,2,8,4])) // 2
    }
}
