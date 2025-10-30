final class MinimumNumberofIncrementsonSubarraystoFormaTargetArray {
    func minNumberOperations(_ target: [Int]) -> Int {
        var prevMax = 0
        var result = 0
        let target = target + [0, 1]
        for i in 0..<target.count {
            let prev = i - 1 >= 0 ? target[i - 1] : 0
            let num = target[i]
            if num > prev {
                result += (prevMax - prev)
                prevMax = num
            }
        }
        return result
    }
    
    func tests() {
        print(minNumberOperations([1,2,3,2,1])) // 3
        print(minNumberOperations([3,1,1,2])) // 4
        print(minNumberOperations([3,1,5,4,2])) // 7
    }
}
