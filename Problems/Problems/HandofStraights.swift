class HandofStraights {
    func isNStraightHand(_ hand: [Int], _ groupSize: Int) -> Bool {
        guard hand.count % groupSize == 0 else { return false }
        guard groupSize > 1 else { return true }
        var map: [Int: Int] = [:]
        for num in hand {
            map[num, default: 0] += 1
        }
        while !map.isEmpty {
            for num in map.keys {
                if map[num - 1] != nil { continue }
                for i in 0..<groupSize {
                    guard let n = map[num + i] else { return false }
                    map[num + i] = (n - 1 > 0) ? (n - 1) : nil
                }
                break
            }
        }
        return true
    }
    
    func tests() {
        print(isNStraightHand([1,2,3,6,2,3,4,7,8], 3)) // true
        print(isNStraightHand([1,2,3,4,5], 4)) // false
    }
}

