class DesignAddAndSearchWordsDataStructure {
    
    class Node {
        var childs: [Character: Node] = [:]
        var isTerminated = false
    }
    
    private var root = Node()
    private var maxWordCount = 0
    init() {
    }
    
    func addWord(_ word: String) {
        maxWordCount = max(maxWordCount, word.count)
        var node = root
        for c in word {
            if node.childs[c] == nil {
                node.childs[c] = Node()
            }
            node = node.childs[c]!
        }
        node.isTerminated = true
    }
    
    func search(_ word: String) -> Bool {
        guard word.count <= maxWordCount else { return false }
        var candidates: [Node] = [root]
        for c in word {
            var nextCandidates: [Node] = []
            for node in candidates {
                guard node.childs[c] != nil || c == "." else { continue }
                if node.childs[c] != nil {
                    nextCandidates.append(node.childs[c]!)
                } else {
                    nextCandidates.append(contentsOf: node.childs.values)
                }
            }
            candidates = nextCandidates
            guard !candidates.isEmpty else { return false }
        }
        
        return candidates.reduce(into: false) { $0 = $0 || $1.isTerminated }
    }

    func tests() {
        print(root) //
        addWord("bad")
        addWord("dad")
        addWord("mad")
        print(root) //
        print(search("pad"))
        print(search("p.d"))
        print(search("sad"))
        print(search("...."))
        print(search(".."))
        print(search("bad"))
        print(search(".ad"))
        print(search("b.."))
    }
}

