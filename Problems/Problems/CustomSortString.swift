class CustomSortString {
    func customSortString(_ order: String, _ s: String) -> String {
        var map: [Character: Int] = [:] // char: count
        for (i, c) in s.enumerated() {
            map[c, default: 0] += 1
        }
        var result = Array(repeating: Character("."), count: s.count)
        var i = 0
        for c in order {
            for _ in 0..<(map[c] ?? 0) {
                result[i] = c
                i += 1
            }
            map[c] = nil
        }
        for (char, count) in map {
            for _ in 0..<count {
                result[i] = char
                i += 1
            }
        }
        return String(result)
    }

    func customSortStringSortedSolution(_ order: String, _ s: String) -> String {
        var map: [Character: Int] = [:]
        for (i, c) in order.enumerated() {
            map[c] = i
        }
        return String(s.sorted { c1, c2 in
            map[c1] ?? 0 < map[c2] ?? 0
        })
    }
    
    func tests() {
        print(customSortString("cba", "abcd")) // "cbad"
        print(customSortString("bcafg", "abcd")) // "bcad"
    }
}
