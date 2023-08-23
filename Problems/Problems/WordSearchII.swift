class WordSearchII {
    class TrieNode {
        var word: String?
        var children: [Character: TrieNode] = [:]
    }

    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        guard !board.isEmpty else { return [] }
        let n = board.count
        let m = board[0].count
        var result: [String] = []
        var board = board

        let root = TrieNode()
        for word in words {
            var node = root
            for char in word {
                if node.children[char] == nil {
                    node.children[char] = TrieNode()
                }
                node = node.children[char]!
            }
            node.word = word
        }

        func dfs(_ i: Int, _ j: Int, _ node: TrieNode, _ onFound: (String) -> Void) {
            guard i >= 0 && j >= 0 && i < n && j < m else { return }
            guard let currNode = node.children[board[i][j]] else { return }

            if let word = currNode.word {
                currNode.word = nil
                onFound(word)
            }
            let char = board[i][j]
            board[i][j] = "#"

            dfs(i - 1, j, currNode, onFound)
            dfs(i + 1, j, currNode, onFound)
            dfs(i, j - 1, currNode, onFound)
            dfs(i, j + 1, currNode, onFound)
            
            board[i][j] = char
        }

        for i in 0..<board.count {
            for j in 0..<board[0].count {
                dfs(i, j, root) { word in
                    result.append(word)
                }
            }
        }

        return result
    }

    func tests() {
        print(findWords(
            [["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]],
            ["oath","pea","eat","rain"])
        ) // ["eat","oath"]
        print(findWords(
            [["a","b"],["c","d"]],
            ["abcb"])
        ) // []
    }
}

