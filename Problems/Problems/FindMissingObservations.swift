class FindMissingObservations {
    func missingRolls(_ rolls: [Int], _ mean: Int, _ n: Int) -> [Int] {
        let m = rolls.count
        let sum = rolls.reduce(0, +)
        let fullSum = (m + n) * mean
        guard fullSum >= sum + n && fullSum <= sum + 6 * n else { return [] }
        var nSum = fullSum - sum
        let mid = nSum / n
        var result = Array(repeating: mid, count: n)
        nSum -= mid * n
        var i = 0
        while nSum > 0 {
            let newVal: Int
            if nSum < 6 - mid {
                newVal = mid + nSum
            } else {
                newVal = 6
            }
            nSum -= (newVal - mid)
            result[i] = newVal
            i += 1
        }
        return result
    }
    
    func tests() {
        print(missingRolls([3,2,4,3], 4, 2)) // [6,6]
        print(missingRolls([1,5,6], 3, 4)) // [2,3,2,2]
        print(missingRolls([1,2,3,4], 6, 4)) // []
    }
}

