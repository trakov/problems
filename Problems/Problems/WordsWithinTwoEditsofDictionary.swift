final class WordsWithinTwoEditsofDictionary {
    func twoEditWords(_ queries: [String], _ dictionary: [String]) -> [String] {
        queries.filter {
            for word in dictionary {
                var dif = 0
                for (w, c) in zip(word, $0) where w != c {
                    dif += 1
                    if dif > 2 { break }
                }
                if dif <= 2 { return true }
            }
            return false
        }
    }
    
    func tests() {
        print(twoEditWords(["word","note","ants","wood"], ["wood","joke","moat"]))
        // ["word","note","wood"]
        print(twoEditWords(["yes"], ["not"])) // []
    }
}
