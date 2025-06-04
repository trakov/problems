final class FindtheLexicographicallyLargestStringFromtheBoxI {
    func answerString(_ word: String, _ numFriends: Int) -> String {
        guard numFriends > 1 else { return word }
        let word = Array(word)
        let n = word.count
        var (i, j) = (0, 1)
        while j < n {
            var k = 0
            while j + k < n && word[i + k] == word[j + k] {
                k += 1
            }
            if j + k < n && word[i + k] < word[j + k] {
                (i, j) = (j, max(j + 1, i + k + 1))
            } else {
                j = j + k + 1
            }
        }
        let last = word.suffix(from: i)
        let m = last.count
        return String(last.prefix(min(m, n - numFriends + 1)))
    }
    
    func tests() {
        print(answerString("dbca", 2)) // "dbc"
        print(answerString("gggg", 4)) // "g"
    }
}
