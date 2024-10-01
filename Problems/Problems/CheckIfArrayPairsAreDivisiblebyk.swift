class CheckIfArrayPairsAreDivisiblebyk {
    func canArrange(_ arr: [Int], _ k: Int) -> Bool {
        var map: [Int: Int] = [:] // num: count
        for num in arr {
            let n = (num % k + k) % k
            let compl = (k - n) % k
            if let count = map[compl] {
                if count == 1 {
                    map[compl] = nil
                } else {
                    map[compl] = count - 1
                }
            } else {
                map[n, default: 0] += 1
            }
        }
        return map.isEmpty
    }
    
    func tests() {
        print(canArrange([-1,1,-2,2,-3,3,-4,4], 3)) // true
        print(canArrange([2,2,2,3,3,3], 5)) // true
        print(canArrange([1,2,3,4,5,10,6,7,8,9], 5)) // true
        print(canArrange([1,2,3,4,5,6], 7)) // true
        print(canArrange([1,2,3,4,5,6], 10)) // false
    }
}

