class WordSearch {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let n = board.count
        let m = board[0].count
        guard n * m >= word.count else { return false }
        var board = board
        let word = Array(word)
        func dfs(i: Int, j: Int, wordIndex: Int) -> Bool {
            guard i >= 0, i < n, j >= 0, j < m, board[i][j] == word[wordIndex] else { return false }
            board[i][j] = "#"
            defer {
                board[i][j] = word[wordIndex]
            }
            if wordIndex == word.count - 1 {
                return true
            } else {
                return dfs(i: i - 1, j: j, wordIndex: wordIndex + 1) ||
                dfs(i: i + 1, j: j, wordIndex: wordIndex + 1) ||
                dfs(i: i, j: j - 1, wordIndex: wordIndex + 1) ||
                dfs(i: i, j: j + 1, wordIndex: wordIndex + 1)
            }
        }
        
        for i in 0..<n {
            for j in 0..<m {
                if dfs(i: i, j: j, wordIndex: 0) {
                    return true
                }
            }
        }
        return false
    }
    
    func exist2(_ board: [[Character]], _ word: String) -> Bool {
        var candidates: [[(Int, Int)]] = []
        var reversedCandidates: [[(Int, Int)]] = []
        
        var array = Array(word)
        
        for line in 0 ..< board.count {
            for column in 0 ..< board[line].count {
                if board[line][column] == word.first! {
                    candidates.append([(line, column)])
                }
                if board[line][column] == word.last! {
                    reversedCandidates.append([(line, column)])
                }
                if let index = array.firstIndex(of: board[line][column]) {
                    array.remove(at: index)
                }
            }
        }

        if array.count > 0 || candidates.count == 0 || reversedCandidates.count == 0 {
            return false
        }
        
        let useReverse = reversedCandidates.count < candidates.count
        if useReverse {
            candidates = reversedCandidates
        }
        let word: [Character] = useReverse ? Array(word.reversed()) : Array(word)
        let n = board.count
        let m = board[0].count
        while !candidates.isEmpty {
            let candidate = candidates.removeFirst()
            if candidate.count == word.count {
                return true
            }
            let c = word[candidate.count]
            let (x, y) = candidate.last!
//            for i in candidate.count ..< word.count {
//                let c = word[i]
                for (dx, dy) in [(-1,0), (1,0), (0,-1), (0,1)] {
                    let nx = x+dx
                    let ny = y+dy
                    if nx<0 || nx>n-1 || ny<0 || ny>m-1 { continue }
                    if board[nx][ny] != c { continue }
                    if candidate.contains(where: {$0 == (nx,ny)}) { continue }
                    if candidate.count + 1 == word.count {
                        return true
                    }
                    candidates.append(candidate + [(nx, ny)])
                }
//            }
        }
        return false
    }
    
    func tests() {
        print(exist([
            ["A","A","A","A","A","A"],
            ["A","A","A","A","A","A"],
            ["A","A","A","A","A","A"],
            ["A","A","A","A","A","A"],
            ["A","A","A","A","A","A"],
            ["A","A","A","A","A","A"]
        ], "AAAAAAAAAAAABAA")) // false
        
        print(exist([
            ["A","A","A","A","A","A"],
            ["A","A","A","A","A","A"],
            ["A","A","A","A","A","A"],
            ["A","A","A","A","A","A"],
            ["A","A","A","A","A","A"],
            ["A","A","A","A","A","A"]
        ], "AAAAAAAAAAAAAAB")) // false
        
        print(exist([
            ["a"]
        ], "a")) // true
                
        print(exist([
            ["A","B","C","E"],
            ["S","F","C","S"],
            ["A","D","E","E"]
        ], "ABCCED")) // true
        print(exist([
            ["A","B","C","E"],
            ["S","F","C","S"],
            ["A","D","E","E"]
        ], "SEE")) // true
        print(exist([
            ["A","B","C","E"],
            ["S","F","C","S"],
            ["A","D","E","E"]
        ], "ABCB")) // false
    }
}
