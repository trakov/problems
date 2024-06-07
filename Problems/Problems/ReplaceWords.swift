class ReplaceWords {
    func replaceWords(_ dictionary: [String], _ sentence: String) -> String {
        let dictionary = dictionary.sorted { $0.count < $1.count }
        return sentence
            .components(separatedBy: " ")
            .map { word in dictionary.first { word.hasPrefix($0) } ?? word }
            .joined(separator: " ")
    }

    func tests() {
        print(replaceWords(
            ["cat","bat","rat"],
            "the cattle was rattled by the battery"
        )) // "the cat was rat by the bat"
        print(replaceWords(
            ["a","b","c"],
            "aadsfasf absbs bbab cadsfafs"
        )) // "a a b c"
    }
}

