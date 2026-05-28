final class LongestCommonSuffixQueries {
    class TrieNode {
        var children: [TrieNode?] = Array(repeating: nil, count: 26)
        var minLen = Int.max
        var idx = Int.max
        init() {
            for i in 0..<26 {
                children[i] = nil
            }
        }
    }

    class Trie {
        var root = TrieNode()
        func insert(_ s: String, _ idx: Int) {
            let len = s.count
            var node = root
            if len < node.minLen {
                node.minLen = len
                node.idx = idx
            }
            for ch in s {
                let c = Int(ch.asciiValue! - Character("a").asciiValue!)
                if node.children[c] == nil {
                    node.children[c] = TrieNode()
                }
                node = node.children[c]!
                if len < node.minLen {
                    node.minLen = len
                    node.idx = idx
                }
            }
        }

        func query(_ s: String) -> Int {
            var node = root
            for ch in s {
                let c = Int(ch.asciiValue! - Character("a").asciiValue!)
                if node.children[c] != nil {
                    node = node.children[c]!
                } else {
                    break
                }
            }
            return node.idx
        }
    }
    func stringIndices(_ wordsContainer: [String], _ wordsQuery: [String]) -> [Int] {
        let trie = Trie()
        for (i, s) in wordsContainer.enumerated() {
            let s = String(s.reversed())
            trie.insert(s, i)
        }
        var result = Array(repeating: 0, count: wordsQuery.count)
        for (i, s) in wordsQuery.enumerated() {
            let s = String(s.reversed())
            result[i] = trie.query(s)
        }
        return result
    }
    
    func tests() {
        print(stringIndices(["abcd","bcd","xbcd"], ["cd","bcd","xyz"])) // [1,1,1]
        print(stringIndices(["abcdefgh","poiuygh","ghghgh"], ["gh","acbfgh","acbfegh"])) // [2,0,2]
    }
}
