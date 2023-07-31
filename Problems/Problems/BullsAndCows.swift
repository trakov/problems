class BullsAndCows {
    func getHint(_ secret: String, _ guess: String) -> String {
        guard secret.count == guess.count else { return "" }
        var secretDict: [Character: Set<Int>] = [:]
        var guessDict: [Character: Set<Int>] = [:]
        for (i, c) in secret.enumerated() {
            secretDict[c, default: []].insert(i)
        }
        for (i, c) in guess.enumerated() {
            guessDict[c, default: []].insert(i)
        }
        var bulls = 0
        var cows = 0
        for (char, indexes) in guessDict {
            if let sIndexes = secretDict[char] {
                let common = indexes.intersection(sIndexes).count
                bulls += common
                cows += max(min(indexes.count, sIndexes.count) - common, 0)
            }
        }
        return "\(bulls)A\(cows)B"
    }

    func tests() {
        print(getHint("1807", "7810")) // "1A3B"
        print(getHint("1123", "0111")) // "1A1B"
    }
}
