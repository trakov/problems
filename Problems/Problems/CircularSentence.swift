class CircularSentence {
    func isCircularSentence(_ sentence: String) -> Bool {
        let words = sentence.split(separator: " ")
        let n = words.count
        for (i, word) in words.enumerated() {
            let prev = words[(i - 1 + n) % n]
            guard prev.last == word.first else { return false }
        }
        return true
    }
    
    func tests() {
        print(isCircularSentence("leetcode exercises sound delightful")) // true
        print(isCircularSentence("eetcode")) // true
        print(isCircularSentence("Leetcode is cool")) // false
    }
}

