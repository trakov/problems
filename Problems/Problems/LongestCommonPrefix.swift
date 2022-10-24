class LongestCommonPrefix {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard var result = strs.first else { return "" }
        for str in strs {
            while !str.hasPrefix(result) {
                result.removeLast()
            }
        }
        return result
    }
    
    func tests() {
        print(longestCommonPrefix(["flower","flow","flight"]))
        print(longestCommonPrefix(["dog","racecar","car"]))
    }
}
