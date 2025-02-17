class LetterTilePossibilities {
    func numTilePossibilities(_ tiles: String) -> Int {
        let n = tiles.count
        guard n > 1 else { return n }
        var map: [Character: Int] = [:]
        for tile in tiles {
            map[tile, default: 0] += 1
        }
        func dfs() -> Int {
            var result = 0
            for (tile, count) in map where count > 0 {
                result += 1
                map[tile] = count - 1
                result += dfs()
                map[tile] = count
            }
            return result
        }
        return dfs()
    }
    
    func tests() {
        print(numTilePossibilities("AAB")) // 8
        print(numTilePossibilities("AAABBC")) // 188
        print(numTilePossibilities("V")) // 1
    }
}

