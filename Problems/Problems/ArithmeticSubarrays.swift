class ArithmeticSubarrays {
    func checkArithmeticSubarrays(_ nums: [Int], _ l: [Int], _ r: [Int]) -> [Bool] {
        var result = Array(repeating: true, count: l.count)
        for (i, left) in l.enumerated() {
            let right = r[i]
            var minVal = Int.max
            var maxVal = Int.min
            for k in left...right {
                minVal = min(minVal, nums[k])
                maxVal = max(maxVal, nums[k])
            }
            let n = right - left + 1
            guard (maxVal - minVal) % (n - 1) == 0 else {
                result[i] = false
                continue
            }
            let diff = (maxVal - minVal) / (n - 1)
            guard diff > 0 else { continue }
            var count: [Int?] = Array(repeating: nil, count: n)
            for j in left...right {
                let num = nums[j]
                let k = (num - minVal) / diff
                guard (num - minVal) % diff == 0 && count[k] == nil else {
                    result[i] = false
                    break
                }
                count[k] = num
            }
        }
        return result
    }

    func checkArithmeticSubarrays2(_ nums: [Int], _ l: [Int], _ r: [Int]) -> [Bool] {
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
        print(checkArithmeticSubarrays(
            [-3,-6,-8,-4,-2,-8,-6,0,0,0,0],
            [5,4,3,2,4,7,6,1,7],
            [6,5,6,3,7,10,7,4,10])
        )
    }
}

