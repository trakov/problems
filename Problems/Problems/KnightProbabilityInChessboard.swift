class KnightProbabilityInChessboard {
    struct Pair: Hashable {
        let x: Int
        let y: Int
    }
    
    struct PairK: Hashable {
        let pair: Pair
        let k: Int
    }
    
    func knightProbability(_ n: Int, _ k: Int, _ row: Int, _ column: Int) -> Double {
        guard k > 0 else { return 1 }
        guard n > 2 else { return 0 }
        
        func moves(from pair: Pair) -> [Pair] {
            [(1,2),(-1,2),(1,-2),(-1,-2),(2,1),(-2,1),(2,-1),(-2,-1)].compactMap {
                let x = pair.x + $0
                let y = pair.y + $1
                guard x >= 0 && y >= 0 && x < n && y < n else { return nil }
                return Pair(x: x, y: y)
            }
        }

        var cache: [PairK: Double] = [:]
        
        func helper(pair: Pair, k: Int) -> Double {
            guard k > 0 else { return 1 }
            if let cached = cache[PairK(pair: pair, k: k)] { return cached }
            var sum = 0.0
            for p in moves(from: pair) {
                sum += helper(pair: p, k: k - 1)
            }
            cache[PairK(pair: pair, k: k)] = sum/8
            return cache[PairK(pair: pair, k: k)]!
        }
        return helper(pair: Pair(x: row, y: column), k: k)
    }
    
    func tests() {
        print(knightProbability(3, 2, 0, 0)) // 0.06250
        print(knightProbability(3, 1, 1, 2)) // 0.25
        print(knightProbability(3, 1, 1, 1)) // 0.0
        print(knightProbability(1, 0, 0, 0)) // 1
        print(knightProbability(8, 30, 6, 4)) // 0.000190
    }
}

