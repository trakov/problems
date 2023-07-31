class DetermineIfTwoStringsAreClose {
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        guard word1.count == word2.count else { return false }
        let word1 = Array(word1).sorted()
        let word2 = Array(word2).sorted()

        var last1 = word1[0]
        var last2 = word2[0]
        var c1: Set<Character> = [last1]
        var c2: Set<Character> = [last2]
        for i in 1 ..< word1.count {
            let n1 = word1[i]
            let n2 = word2[i]
            if n1 == last1 && n2 != last2 {
                return false
            }
            if n1 != last1 && n2 == last2 {
                return false
            }
            last1 = n1
            last2 = n2
            c1.insert(n1)
            c2.insert(n2)
        }
        
        return c1 == c2
    }
    
    func dictionaryArraySolution(_ word1: String, _ word2: String) -> Bool {
        guard word1.count == word2.count else { return false }

        var word1 = Array(word1)
        var word2 = Array(word2)

        var d1: [Character: Int] = [:]
        var d2: [Character: Int] = [:]
        
        var i = 0
        while i < word1.count {
            d1[word1[i], default: 0] += 1
            d2[word2[i], default: 0] += 1
            i += 1
        }
        
        return d1.values.sorted() == d2.values.sorted() && d1.keys.sorted() == d2.keys.sorted()
    }

    func dictionarySolution(_ word1: String, _ word2: String) -> Bool {
        guard word1.count == word2.count else { return false }

        var d1: [Character: Int] = [:]
        var d2: [Character: Int] = [:]
        
        var i = word1.startIndex
        while i < word1.endIndex {
            d1[word1[i], default: 0] += 1
            d2[word2[i], default: 0] += 1
            i = word1.index(after: i)
        }
        
        return d1.values.sorted() == d2.values.sorted() && d1.keys.sorted() == d2.keys.sorted()
    }

    func tests() {
        print(closeStrings("abc", "bca")) // true
        print(closeStrings("a", "aa")) // false
        print(closeStrings("cabbba", "abbccc")) // true
        print(closeStrings("aabbba", "abbccc")) // false
        print(closeStrings("ddbbba", "abbccc")) // false
    }
}
