class UniqueNumberOfOccurrences {
    func uniqueOccurrences(_ arr: [Int]) -> Bool {
        guard arr.count > 1 else { return true }
        var map: [Int: Int] = [:] // num: occurencies
        
        for num in arr {
            map[num, default: 0] += 1
        }
        
        return Set(map.values).count == map.values.count
    }

    func tests() {
        print(uniqueOccurrences([1,2,2,1,1,3])) // true
        print(uniqueOccurrences([1,2])) // false
        print(uniqueOccurrences([-3,0,1,-3,1,1,1,-3,10,0])) // true
    }
}
