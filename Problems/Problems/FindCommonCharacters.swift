class FindCommonCharacters {
    func commonChars(_ words: [String]) -> [String] {
        guard words.count > 1 else {
            return (words.first ?? "").map { String($0) }
        }
        var map: [Character: Int] = [:]
        guard !words[0].isEmpty else { return [] }
        for c in words[0] {
            map[c, default: 0] += 1
        }
        for word in words.dropFirst() {
            guard !word.isEmpty else { return [] }
            var nextMap: [Character: Int] = [:]
            for c in word where map[c] != nil {
                nextMap[c, default: 0] += 1
            }
            for (c, count) in nextMap {
                nextMap[c] = min(count, map[c]!)
            }
            map = nextMap
        }
        var result: [String] = []
        for (c, count) in map {
            result.append(
                contentsOf: Array(repeating: String(c), count: count)
            )
        }
        return result
    }
    
    func tests() {
        print(commonChars(["bella","label","roller"])) // ["e","l","l"]
        print(commonChars(["cool","lock","cook"])) // ["c","o"]
    }
}

