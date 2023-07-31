class ConcatenatedWords {
    func findAllConcatenatedWordsInADict(_ words: [String]) -> [String] {
        let words = Set(words)
        
        func helper(_ str: String, _ count: Int) -> Bool {
            if count > 1 && (words.contains(str) || str.isEmpty) {
                return true
            }
            var temp = [Character]()
            for (i, s) in str.enumerated() {
                temp.append(s)
                if words.contains(String(temp)) {
                    if helper(String(str.suffix(str.count - i - 1)), count + 1) {
                        return true
                    }
                }
            }
            return false
        }

        return words.filter { helper($0, 0) }
    }

    func tests() {
        print(findAllConcatenatedWordsInADict(
            ["cat","cats","catsdogcats","dog","dogcatsdog","hippopotamuses","rat","ratcatdogcat"])
        ) // ["catsdogcats","dogcatsdog","ratcatdogcat"]
        print(findAllConcatenatedWordsInADict(["cat","dog","catdog"])) // ["catdog"]
    }
}
