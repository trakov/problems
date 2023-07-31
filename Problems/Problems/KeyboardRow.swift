class KeyboardRow {
    func findWords(_ words: [String]) -> [String] {
        let row1 = "qwertyuiop"
        let row2 = "asdfghjkl"
        let row3 = "zxcvbnm"
        var result: [String] = []
        for word in words {
            var rowCandidate: String?
            for c in word.lowercased() {
                if rowCandidate == nil {
                    if row1.contains(c) { rowCandidate = row1 }
                    else if row2.contains(c) { rowCandidate = row2 }
                    else { rowCandidate = row3 }
                } else {
                    if !rowCandidate!.contains(c) { rowCandidate = nil; break }
                }
            }
            if rowCandidate != nil { result.append(word) }
        }
        return result
    }

    func tests() {
        print(findWords(["Hello","Alaska","Dad","Peace"])) // ["Alaska","Dad"]
        print(findWords(["omk"])) // []
        print(findWords(["adsdf","sfd"])) // ["adsdf","sfd"]
    }
}
