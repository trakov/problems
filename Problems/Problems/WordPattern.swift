class WordPattern {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        let words = Array(s.split(separator: " "))
        guard pattern.count == words.count else { return false }
        var dict: [Character: String] = [:]
        for (i, c) in pattern.enumerated() {
            if let word = dict[c] {
                if word != words[i] {
                    return false
                }
            } else {
                dict[c] = String(words[i])
            }
        }
        
        return Set(dict.keys).count == Set(dict.values).count
    }
    
    func tests() {
        print(wordPattern("abba", "dog dog dog dog")) // false
//        print(wordPattern("abba", "dog cat cat dog")) // true
//        print(wordPattern("abba", "dog cat cat fish")) // false
//        print(wordPattern("aaaa", "dog cat cat dog")) // false
    }
}
