class PlusOne {
    func plusOne(_ digits: [Int]) -> [Int] {
        var result = digits
        var one = 1
        for (i, num) in digits.enumerated() {
            if num + one == 10 {
                result[i] = 0
                one = 1
            } else {
                result[i] = num + one
                one = 0
                break
            }
        }
        if one == 1 {
            result.insert(1, at: 0)
        }
        return result
    }
    
    func tests() {
        print(plusOne([1,2,3]))     // [1,2,4]
        print(plusOne([4,3,2,1]))   // [4,3,2,2]
        print(plusOne([0]))         // [1]
        print(plusOne([9]))         // [1,0]
    }
}
