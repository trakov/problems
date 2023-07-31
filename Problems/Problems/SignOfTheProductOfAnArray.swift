class SignOfTheProductOfAnArray {
    func arraySign(_ nums: [Int]) -> Int {
        var sign = 1
        for num in nums {
            if num == 0 { return 0 }
            if num < 0 { sign *= -1 }
        }
        return sign
    }

    func tests() {
        print(arraySign([-1,-2,-3,-4,3,2,1])) // 1
        print(arraySign([1,5,0,2,-3])) // 0
        print(arraySign([-1,1,-1,1,-1])) // -1
    }
}
