class UncommonWordsfromTwoSentences {
    // hashmap
    func uncommonFromSentences(_ s1: String, _ s2: String) -> [String] {
        let words = s1.split(separator: " ") + s2.split(separator: " ")
        var result: [Substring: Int] = [:]
        for word in words {
            result[word, default: 0] += 1
        }
        return result.compactMap { $0.value == 1 ? String($0.key) : nil }
    }

    // set
    func uncommonFromSentences2(_ s1: String, _ s2: String) -> [String] {
        let words = s1.split(separator: " ") + s2.split(separator: " ")
        var result: Set<Substring> = []
        var all: Set<Substring> = []
        for word in words {
            if all.insert(word).inserted {
                result.insert(word)
            } else {
                result.remove(word)
            }
        }
        return result.map { String($0) }
    }
    
    func tests() {
        print(uncommonFromSentences("this apple is sweet", "this apple is sour"))
        // ["sweet","sour"]
        print(uncommonFromSentences("apple apple", "banana"))
        // ["banana"]
    }
}

