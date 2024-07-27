class NumberofUnequalTripletsinArray {
    func unequalTriplets(_ nums: [Int]) -> Int {
        var map: [Int: Int] = [:]
        for num in nums {
            map[num, default: 0] += 1
        }
        guard map.count > 2 else { return 0 }
        var prefix = 0
        var postfix = nums.count
        var result = 0
        for val in map.values {
            postfix -= val
            result += prefix * val * postfix
            prefix += val
        }
        return result
    }

    func unequalTriplets1(_ nums: [Int]) -> Int {
        let n = nums.count
        var result = 0
        for i in 0..<n-2 {
            for j in i+1..<n-1 where nums[i] != nums[j] {
                for k in j+1..<n where nums[i] != nums[k] && nums[j] != nums[k] {
                    result += 1
                }
            }
        }
        return result
    }

    func unequalTriplets2(_ nums: [Int]) -> Int {
        var map: [Int: Int] = [:]
        for num in nums {
            map[num, default: 0] += 1
        }
        let n = map.count
        guard n > 2 else { return 0 }
        let values = Array(map.values)
        var result = 0
        for i in 0..<n-2 {
            for j in i+1..<n-1 {
                for k in j+1..<n {
                    result += values[i] * values[j] * values[k]
                }
            }
        }
        return result
    }
    
    func tests() {
        print(unequalTriplets([4,4,2,4,3])) // 3
        print(unequalTriplets([1,2,3,4,5])) // 10
        print(unequalTriplets([1,2,3,4,4])) // 7
        print(unequalTriplets([1,1,1,1,1])) // 0
    }
}

