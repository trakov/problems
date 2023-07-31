class ArithmeticSubarrays {
    func checkArithmeticSubarrays(_ nums: [Int], _ l: [Int], _ r: [Int]) -> [Bool] {
        var result = Array(repeating: true, count: l.count)
        for (i, left) in l.enumerated() {
            let right = r[i]
            let sub = nums[left...right].sorted()
            guard sub.count > 2 else {
                continue
            }
            for j in 2..<sub.count {
                guard sub[j] - sub[j-1] == sub[j-1] - sub[j-2] else {
                    result[i] = false
                    break
                }
            }
        }
        return result
    }
    
    func tests() {
        print(checkArithmeticSubarrays([4,6,5,9,3,7], [0,0,2], [2,3,5])) // [true,false,true]
        print(checkArithmeticSubarrays(
            [-12,-9,-3,-12,-6,15,20,-25,-20,-15,-10],
            [0,1,6,4,8,7],
            [4,4,9,7,9,10])) // [false,true,false,false,true,true]
    }
}

