class SentenceSimilarityIII {
    func areSentencesSimilar(_ sentence1: String, _ sentence2: String) -> Bool {
        let s1 = sentence1.split(separator: " ")
        let s2 = sentence2.split(separator: " ")
        let n = s1.count
        let m = s2.count
        guard n != m else { return s1 == s2 }
        if n > m { return areSentencesSimilar(sentence2, sentence1) }
        var i = 0
        var (b1, b2) = (n - 1, m - 1)
        while i < n && s1[i] == s2[i] {
            i += 1
        }
        while b1 >= 0 && s1[b1] == s2[b2] {
            b1 -= 1
            b2 -= 1
        }
        return b1 < i
    }
    
    func tests() {
        print(areSentencesSimilar("My name is Haley", "My Haley")) // true
        print(areSentencesSimilar("of", "A lot of words")) // false
        print(areSentencesSimilar("Eating right now", "Eating")) // true
        print(areSentencesSimilar("pp ZM ZJ lE B", "ZM")) // false
        print(areSentencesSimilar("c h p Ny", "c BDQ r h p Ny")) // true
    }
}

