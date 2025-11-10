final class MinimumOperationstoConvertAllElementstoZero {
    func minOperations(_ nums: [Int]) -> Int {
        var stack: [Int] = []
        var result = 0
        for num in nums {
            while stack.last ?? 0 > num {
                stack.removeLast()
            }
            guard num != 0 else { continue }
            if stack.last ?? 0 < num {
                result += 1
                stack.append(num)
            }
        }
        return result
    }
    
    func tests() {
        print(minOperations([0,2])) // 1
        print(minOperations([3,1,2,1])) // 3
        print(minOperations([1,2,1,2,1,2])) // 4
    }
}
