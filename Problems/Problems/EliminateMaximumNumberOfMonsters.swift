class EliminateMaximumNumberOfMonsters {
    func eliminateMaximum(_ dist: [Int], _ speed: [Int]) -> Int {
        let time = dist.enumerated()
            .map { i, d in Double(d)/Double(speed[i]) }
            .sorted()
        for (i, t) in time.enumerated() {
            guard t - Double(i) > 0 else { return i }
        }
        return time.count
    }
    
    func tests() {
        print(eliminateMaximum([1,3,4], [1,1,1])) // 3
        print(eliminateMaximum([1,1,2,3], [1,1,1,1])) // 1
        print(eliminateMaximum([3,2,4], [5,3,2])) // 1
    }
}

