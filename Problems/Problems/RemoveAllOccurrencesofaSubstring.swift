class RemoveAllOccurrencesofaSubstring {
    func removeOccurrences(_ s: String, _ part: String) -> String {
        var result = ""
        for c in s {
            result.append(c)
            if result.hasSuffix(part) {
                result.removeLast(part.count)
            }
        }
        return result
    }
    
    func tests() {
        print(removeOccurrences("daabcbaabcbc", "abc")) // "dab"
        print(removeOccurrences("axxxxyyyyb", "xy")) // "ab"
    }
}

