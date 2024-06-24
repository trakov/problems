class DivideArrayinSetsofKConsecutiveNumbers {
    func isPossibleDivide(_ nums: [Int], _ k: Int) -> Bool {
        guard nums.count % k == 0 else { return false }
        var map: [Int: Int] = [:]
        for num in nums {
            map[num, default: 0] += 1
        }
        let sorted = map.keys.sorted()
        for num in sorted {
            guard let count = map[num] else { continue }
            for j in 0..<k {
                guard let c = map[num + j], c >= count else {
                    return false
                }
                map[num + j] = c - count
                if map[num + j] == 0 { map[num + j] = nil }
            }
        }
        return true
    }
    
    func tests() {
        print(isPossibleDivide([1,2,3,3,4,4,5,6], 4)) // true
        print(isPossibleDivide([3,2,1,2,3,4,3,4,5,9,10,11], 3)) // true
        print(isPossibleDivide([1,2,3,4], 3)) // false
    }
}

