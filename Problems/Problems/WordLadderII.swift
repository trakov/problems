class WordLadderII {
    
    // TLE
    private let allLetters = "abcdefghijklmnopqrstuvwxyz"

    func findLadders(
        _ beginWord: String, _ endWord: String, _ wordList: [String]
    ) -> [[String]] {
        var wordToIndex: [String: Int] = [:]
        for (index, word) in wordList.enumerated() {
            wordToIndex[word] = index
        }
        if wordToIndex[endWord] == nil { return [] }
        let beginWordIndex = -1

        var outputPaths: [[Int]] = []
        var allSeen: Set<Int> = []
        var found = false
        var currentQueue: [[Int]] = [[beginWordIndex]]
        while !found && !currentQueue.isEmpty {
            var nextQueue: [[Int]] = []
            var newSeen: Set<Int> = []
            for path in currentQueue {
                let previousWordIndex = path.last!
                if previousWordIndex == wordToIndex[endWord] {
                    found = true
                    outputPaths.append(path)
                } else {
                    let previousWord = previousWordIndex == beginWordIndex ? beginWord : wordList[previousWordIndex]
                    for (i, c) in previousWord.enumerated() {
                        var word = Array(previousWord)
                        for char in allLetters where c != char {
                            word[i] = char
                            let newWord = String(word)
                            if let index = wordToIndex[newWord], !allSeen.contains(index) {
                                newSeen.insert(index)
                                nextQueue.append(path + [index])
                            }
                        }
                    }
                }
            }
            allSeen.formUnion(newSeen)
            currentQueue = nextQueue
        }
        return outputPaths.map { path in
            path.map { index in
                if index == beginWordIndex {
                    return beginWord
                } else {
                    return wordList[index]
                }
            }
        }
    }

    func tests() {
        print(findLadders("hit", "cog", ["hot","dot","dog","lot","log","cog"]))
        // [["hit","hot","dot","dog","cog"],["hit","hot","lot","log","cog"]]
        print(findLadders("hit", "cog", ["hot","dot","dog","lot","log"])) // []
    }
}

