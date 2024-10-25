class RemoveSubFoldersfromtheFilesystem {
    class Trie {
        var nodes: [Substring: Trie] = [:]
        var end = false
    }
    
    func removeSubfolders(_ folder: [String]) -> [String] {
        guard folder.count > 1 else { return folder }
        let trie = Trie()
        for path in folder {
            var node = trie
            for word in path.split(separator: "/") {
                if node.nodes[word] == nil {
                    node.nodes[word] = Trie()
                }
                node = node.nodes[word]!
            }
            node.end = true
        }
        var result: [String] = []
        for path in folder {
            var node = trie
            var folderNames = path.split(separator: "/")
            var isSubfolder = false
            for (i, name) in folderNames.enumerated() where name != "" {
                let nextNode = node.nodes[name]!
                if nextNode.end && i != folderNames.count - 1 {
                    isSubfolder = true
                    break
                }
                node = nextNode
            }
            if !isSubfolder {
                result.append(path)
            }
        }
        return result
    }
    
    func tests() {
        print(removeSubfolders(["/a","/a/b","/c/d","/c/d/e","/c/f"]))
        // ["/a","/c/d","/c/f"]
        print(removeSubfolders(["/a","/a/b/c","/a/b/d"])) // ["/a"]
        print(removeSubfolders(["/a/b/c","/a/b/ca","/a/b/d"]))
        // ["/a/b/c","/a/b/ca","/a/b/d"]
    }
}

