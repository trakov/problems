class StringMatchinginanArray {
    func stringMatching(_ words: [String]) -> [String] {
        var result: [String] = []
        let words = words.sorted { $0.count < $1.count }
        for (i, word) in words.enumerated() {
            for j in i+1..<words.count {
                if words[j].contains(word) {
                    result.append(word)
                    break
                }
            }
        }
        return result
    }
    
    func tests() {
        print(stringMatching(["mass","as","hero","superhero"])) // ["as","hero"]
        print(stringMatching(["leetcode","et","code"])) // ["et","code"]
        print(stringMatching(["blue","green","bu"])) // []
    }
}

