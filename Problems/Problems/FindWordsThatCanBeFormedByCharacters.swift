class FindWordsThatCanBeFormedByCharacters {
    func countCharacters(_ words: [String], _ chars: String) -> Int {
        var map: [Character: Int] = [:]
        for c in chars {
            map[c, default: 0] += 1
        }
        var result = 0
        for word in words {
            var wMap = map
            var found = true
            for c in word {
                guard wMap[c, default: 0] > 0 else {
                    found = false
                    break
                }
                wMap[c]! -= 1
            }
            if found { result += word.count }
        }
        return result
    }
    
    func tests() {
        print(countCharacters(["cat","bt","hat","tree"], "atach")) // 6
        print(countCharacters(["hello","world","leetcode"], "welldonehoneyr")) // 10
    }
}

