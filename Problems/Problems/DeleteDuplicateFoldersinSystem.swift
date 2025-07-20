final class DeleteDuplicateFoldersinSystem {
    class Trie {
        var serial: String = ""
        var children: [String: Trie] = [:]
    }

    func deleteDuplicateFolder(_ paths: [[String]]) -> [[String]] {
        func construct(_ node: Trie, _ freq: inout [String: Int]) {
            if node.children.isEmpty { return }
            var v: [String] = []
            for (entry, n) in node.children {
                construct(n, &freq)
                v.append(entry + "(" + n.serial + ")")
            }
            v.sort()
            let sb = v.joined()
            node.serial = sb
            freq[node.serial, default: 0] += 1
        }
        func operate(
            _ node: Trie, _ freq: [String: Int], _ path: inout [String], _ ans: inout [[String]]
        ) {
            if freq[node.serial] ?? 0 > 1 { return }
            if !path.isEmpty {
                ans.append(path)
            }
            for (entry, n) in node.children {
                path.append(entry)
                operate(n, freq, &path, &ans)
                path.removeLast()
            }
        }
        let root = Trie()
        for path in paths {
            var cur = root
            for node in path {
                if cur.children[node] == nil {
                    cur.children[node] = Trie()
                }
                cur = cur.children[node]!
            }
        }
        var freq: [String: Int] = [:]
        construct(root, &freq)
        var result: [[String]] = []
        var path: [String] = []
        operate(root, freq, &path, &result)
        return result
    }
    
    func tests() {
        print(deleteDuplicateFolder(
            [["a"],["c"],["d"],["a","b"],["c","b"],["d","a"]]
        ))
        // [["d"],["d","a"]]
        print(deleteDuplicateFolder(
            [["a"],["c"],["a","b"],["c","b"],["a","b","x"],["a","b","x","y"],["w"],["w","y"]]
        ))
        // [["c"],["c","b"],["a"],["a","b"]]
        print(deleteDuplicateFolder(
            [["a","b"],["c","d"],["c"],["a"]]
        ))
        // [["c"],["c","d"],["a"],["a","b"]]))
    }
}
