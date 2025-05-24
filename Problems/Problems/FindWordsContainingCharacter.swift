final class FindWordsContainingCharacter {
    func findWordsContaining(_ words: [String], _ x: Character) -> [Int] {
        var result: [Int] = []
        for (index, word) in words.enumerated() where word.contains(x) {
            result.append(index)
        }
        return result
    }
    
    func tests() {
        print(findWordsContaining(["leet","code"], "e")) // [0,1]
        print(findWordsContaining(["abc","bcd","aaaa","cbc"], "a")) // [0,2]
        print(findWordsContaining(["abc","bcd","aaaa","cbc"], "z")) // []
    }
}
