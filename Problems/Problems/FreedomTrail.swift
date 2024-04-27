class FreedomTrail {
    func findRotateSteps(_ ring: String, _ key: String) -> Int {
        var indices: [Character: Set<Int>] = [:]
        for (i, c) in ring.enumerated() {
            indices[c, default: []].insert(i)
        }
        var level = [(0, 0)] // steps, position
        for c in key {
            var nextLevel: [(Int, Int)] = []
            for index in indices[c] ?? [] {
                var steps = Int.max
                for state in level {
                    let temp = abs(state.1 - index)
                    steps = min(steps, min(temp, ring.count - temp) + state.0)
                }
                nextLevel.append((steps, index))
            }
            level = nextLevel
        }
        return level.min(by: { $0.0 < $1.0 })!.0 + key.count
    }

    func tests() {
        print(findRotateSteps("godding", "gd")) // 4
        print(findRotateSteps("godding", "godding")) // 13
    }
}

