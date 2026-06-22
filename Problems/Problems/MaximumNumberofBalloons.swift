final class MaximumNumberofBalloons {
    func maxNumberOfBalloons(_ text: String) -> Int {
        var map: [Character: Int] = [:]
        for char in text {
            map[char, default: 0] += 1
        }
        var result = text.count
        let balloon: [Character: Int] = ["b": 1, "a": 1, "l": 2, "o": 2, "n": 1]
        for (char, count) in balloon {
            guard let value = map[char] else { return 0 }
            result = min(result, value / count)
        }
        return result
    }
    
    func tests() {
        print(maxNumberOfBalloons("nlaebolko")) // 1
        print(maxNumberOfBalloons("loonbalxballpoon")) // 2
        print(maxNumberOfBalloons("leetcode")) // 0
    }
}
