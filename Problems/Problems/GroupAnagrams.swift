class GroupAnagrams {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var result: [Int: [String]] = [:]
        
        for str in strs {
            var val = Array(repeating: 0, count: 26)
            for c in str {
                val[Int(c.asciiValue! - Character("a").asciiValue!)] += 1
            }
            result[val.hashValue, default: []].append(str)
        }
        
        return Array(result.values)
    }

    func groupAnagrams2(_ strs: [String]) -> [[String]] {
        var result: [Int: [String]] = [:]
        
        for str in strs {
            result[str.sorted().hashValue, default: []].append(str)
        }
        
        return Array(result.values)
    }
    
    func tests() {
        print(groupAnagrams(["eat","tea","tan","ate","nat","bat"]))
//        [["bat"],["nat","tan"],["ate","eat","tea"]]
        print(groupAnagrams([""])) // [[""]]
        print(groupAnagrams(["a"])) // [["a"]]
    }
}

