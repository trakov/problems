class MakeTwoArraysEqualbyReversingSubarrays {
    func canBeEqual(_ target: [Int], _ arr: [Int]) -> Bool {
        var map: [Int: Int] = [:]
        for num in target {
            map[num, default: 0] += 1
        }
        for num in arr {
            guard let c = map[num] else { return false }
            if c > 1 {
                map[num] = c - 1
            } else {
                map[num] = nil
            }
        }
        return true
    }
    
    func tests() {
        print(canBeEqual([1,2,3,4], [2,4,1,3])) // true
    }
}

