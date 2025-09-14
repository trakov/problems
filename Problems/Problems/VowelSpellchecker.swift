final class VowelSpellchecker {
    private let vowelSet: Set<Character> = ["a", "e", "i", "o", "u"]
    func devowel(_ word: String) -> String {
        String(word.map { vowelSet.contains($0) ? "*" : $0 })
    }
    func spellchecker(_ wordlist: [String], _ queries: [String]) -> [String] {
        var words_perfect: Set<String> = []
        var words_cap: [String: String] = [:]
        var words_vow: [String: String] = [:]
        for word in wordlist {
            words_perfect.insert(word)
            let wordlow = word.lowercased()
            if words_cap[wordlow] == nil {
                words_cap[wordlow] = word
            }
            let wordlowDV = devowel(wordlow)
            if words_vow[wordlowDV] == nil {
                words_vow[wordlowDV] = word
            }
        }
        func solve(_ query: String) -> String {
            if words_perfect.contains(query) { return query }
            let queryL = query.lowercased()
            return words_cap[queryL] ?? words_vow[devowel(queryL)] ?? ""
        }
        var result = Array(repeating: "", count: queries.count)
        for (i, query) in queries.enumerated() {
            result[i] = solve(query)
        }
        return result
    }

    func tests() {
        print(spellchecker(
            ["KiTe","kite","hare","Hare"],
            ["kite","Kite","KiTe","Hare","HARE","Hear","hear","keti","keet","keto"]
        )) // ["kite","KiTe","KiTe","Hare","hare","","","KiTe","","KiTe"]
        print(spellchecker(["yellow"], ["YellOw"])) // ["yellow"]
    }
}
