class ProductOfArrayExceptSelf {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var result = Array(repeating: 1, count: nums.count)
        for i in 1..<nums.count {
            result[i] = result[i-1] * nums[i-1] // collecting prefixes
        }
        var temp = 1 // suffix
        for i in (0..<nums.count).reversed() {
            result[i] *= temp
            temp *= nums[i]
        }
        return result
    }

    func productExceptSelf2(_ nums: [Int]) -> [Int] {
        var zeroCount = 0
        let product = nums.reduce(into: 1) {
            if $1 != 0 {
                $0 *= $1
            } else {
                zeroCount += 1
            }
        }
        guard zeroCount < 2 else { return Array(repeating: 0, count: nums.count) }
        let result = nums.map {
            if $0 != 0 {
                return zeroCount > 0 ? 0 : product / $0
            } else {
                return product
            }
        }
        return result
    }
    
    func tests() {
        print(productExceptSelf([1,2,3,4])) // [24,12,8,6]
        print(productExceptSelf([-1,1,0,-3,3])) // [0,0,9,0,0]
    }
}

