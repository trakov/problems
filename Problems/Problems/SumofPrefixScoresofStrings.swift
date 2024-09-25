class SumofPrefixScoresofStrings {
    class Trie {
        var kids: [Trie?] = Array(repeating: nil, count: 26)
        var count = 0
        
        func insert(_ word: String) {
            var node = self
            for c in word {
                let index = index(c)
                if node.kids[index] == nil {
                    node.kids[index] = Trie()
                }
                node.kids[index]?.count += 1
                node = node.kids[index]!
            }
        }
        
        func count(_ word: String) -> Int {
            var node = self
            var count = 0
            for c in word {
                let index = index(c)
                count += node.kids[index]!.count
                node = node.kids[index]!
            }
            return count
        }
        
        private func index(_ c: Character) -> Int {
            Int(c.asciiValue! - Character("a").asciiValue!)
        }
    }
    
    func sumPrefixScores(_ words: [String]) -> [Int] {
        let root = Trie()
        let n = words.count
        for word in words {
            root.insert(word)
        }
        var result = Array(repeating: 0, count: n)
        for (i, word) in words.enumerated() {
            result[i] = root.count(word)
        }
        return result
    }
    
    func tests() {
        print(sumPrefixScores(["abc","ab","bc","b"])) // [5,4,3,2]
        print(sumPrefixScores(["abcd"])) // [4]
    }
}

