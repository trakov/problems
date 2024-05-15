class WordBreak {
    class TrieNode {
        var word: String?
        var nodes: [Character: TrieNode] = [:]
    }

    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let trie = TrieNode()
        for word in wordDict {
            var node = trie
            for c in word {
                if node.nodes[c] == nil {
                    node.nodes[c] = TrieNode()
                }
                node = node.nodes[c]!
            }
            node.word = word
        }
        let s = Array(s)
        func search(_ start: Int, _ end: Int) -> Bool {
            var node: TrieNode? = trie
            for i in start..<end where node != nil {
                let c = s[i]
                node = node?.nodes[c]
            }
            return node?.word != nil
        }
        
        var dp = Array(repeating: false, count: s.count + 1)
        dp[0] = true
        for i in 1...s.count {
            for j in 0..<i {
                guard dp[j], search(j, i) else { continue }
                dp[i] = true
                break
            }
        }
        return dp[s.count]
    }

    func wordBreak2(_ s: String, _ wordDict: [String]) -> Bool {
        var dp = Array(repeating: false, count: s.count + 1)
        dp[0] = true
        let s = Array(s)
        let wordSet = Set(wordDict)
        for i in 1...s.count {
            for j in 0..<i {
                guard dp[j], wordSet.contains(String(s[j..<i])) else { continue }
                dp[i] = true
                break
            }
        }
        return dp[s.count]
    }

    func tests() {
        print(wordBreak("aaaaaaa", ["aaaa","aaa"])) // true
        print(wordBreak("aaaaaaa", ["aaaa","aa"])) // false
        print(wordBreak("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab",["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"])) // false
        print(wordBreak("leetcode", ["leet","code"])) // true
        print(wordBreak("applepenapple", ["apple","pen"])) // true
        print(wordBreak("catsandog", ["cats","dog","sand","and","cat"])) // false
    }
}
