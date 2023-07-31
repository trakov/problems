class WordLadder {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var words = Set(wordList)
        guard words.contains(endWord) else { return 0 }
        let alphabet = "abcdefghijklmnopqrstuvwxyz"
        var queue: [(String, Int)] = [(beginWord, 1)]
        
        while !queue.isEmpty {
            let (word, step) = queue.removeFirst()
            guard word != endWord else { return step }
            
            for i in 0..<word.count {
                var chars = Array(word)
                for ch in alphabet where ch != chars[i] {
                    chars[i] = ch
                    let modified = String(chars)
                    if words.remove(modified) != nil {
                        queue.append((modified, step + 1))
                    }
                }
            }
        }
        return 0
    }

    func tests() {
        print(ladderLength("hit", "cog", ["hot","dot","dog","lot","log","cog"])) // 5
        print(ladderLength("hit", "cog", ["hot","dot","dog","lot","log"])) // 0
    }
}
