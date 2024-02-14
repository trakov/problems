class RearrangeArrayElementsBySign {
    func rearrangeArray(_ nums: [Int]) -> [Int] {
        let n = nums.count
        var result = Array(repeating: 0, count: n)
        var pos = 0
        var neg = 1
        for num in nums {
            if num > 0 {
                result[pos] = num
                pos += 2
            } else {
                result[neg] = num
                neg += 2
            }
        }
        return result
    }
    
    func tests() {
        print(rearrangeArray([3,1,-2,-5,2,-4])) // [3,-2,1,-5,2,-4]
        print(rearrangeArray([-1,1])) // [1,-1]
    }
}

