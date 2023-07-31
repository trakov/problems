class GroupAnagrams {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
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

