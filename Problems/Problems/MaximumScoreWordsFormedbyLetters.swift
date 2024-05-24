class MaximumScoreWordsFormedbyLetters {
    func maxScoreWords(_ words: [String], _ letters: [Character], _ score: [Int]) -> Int {
        let n = words.count
        var weight = Array(repeating: 0, count: n)
        for (i, word) in words.enumerated() {
            weight[i] = word.reduce(0) {
                $0 + score[Int($1.asciiValue! - Character("a").asciiValue!)]
            }
        }
        var result = 0
        let map: [Character: Int] = letters.reduce([:]) {
            var next = $0
            next[$1, default: 0] += 1
            return next
        }
        
        func removeWord(_ word: String, from map: [Character: Int]) -> [Character: Int]? {
            var tempMap = map
            for c in word {
                guard let count = tempMap[c], count > 0 else { return nil }
                tempMap[c] = count - 1
            }
            return tempMap
        }
        
        func backtrack(_ idx: Int, _ curMap: [Character: Int], _ cur: Int) {
            result = max(result, cur)
            guard idx < n else { return }
            if let nextMap = removeWord(words[idx], from: curMap) {
                backtrack(idx + 1, nextMap, cur + weight[idx])
            }
            backtrack(idx + 1, curMap, cur)
        }
        backtrack(0, map, 0)
        return result
    }
    
    func tests() {
        print(maxScoreWords(
            ["dog","cat","dad","good"],
            ["a","a","c","d","d","d","g","o","o"],
            [1,0,9,5,0,0,3,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0]
        )) // 23
        print(maxScoreWords(
            ["xxxz","ax","bx","cx"],
            ["z","a","b","c","x","x","x"],
            [4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0,10]
        )) // 27
        print(maxScoreWords(
            ["leetcode"],
            ["l","e","t","c","o","d"],
            [0,0,1,1,1,0,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,0,0,0,0]
        )) // 0
    }
}

