class SortCharactersByFrequency {
    func frequencySort(_ s: String) -> String {
        var d: [Character: Int] = [:]
        for c in s {
            d[c, default: 0] += 1
        }
        return d.sorted(by: { $0.value > $1.value }).reduce("") {
            $0 + String(repeating: $1.key, count: $1.value)
        }
    }

    func tests() {
        print(frequencySort("tree")) // eert // eetr
        print(frequencySort("cccaaa")) // cccaaa // aaaccc
        print(frequencySort("Aabb")) // bbAa // bbaA
    }
}
