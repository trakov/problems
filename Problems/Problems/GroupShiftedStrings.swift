class GroupShiftedStrings {
    func getKey(_ s: String) -> [Int] {
        guard s.count > 0 else { return [] }
        guard s.count > 1 else { return [-1] }
        var key = Array(repeating: 0, count: s.count - 1)
        var prev = s.first!
        for (i, c) in s.enumerated().dropFirst() {
            let diff = (Int(c.asciiValue!) - Int(prev.asciiValue!) + 26) % 26
            key[i - 1] = diff
        }
        return key
    }

    func groupStrings(_ strings: [String]) -> [[String]] {
        var map: [[Int]: [String]] = [:]
        for s in strings {
            let key = getKey(s)
            map[key, default: []].append(s)
        }
        return Array(map.values)
    }

    func group(_ strings: [String]) -> [[String]] {
        var map: [[Int]: [String]] = [:]
        for string in strings {
            map[key(for: string), default: []].append(string)
        }
        print(map)
        return Array(map.values)
    }
    
    func key(for s: String) -> [Int] {
        guard !s.isEmpty else { return [] }
        guard s.count > 1 else { return [-26] }
        let s = Array(s)
        var key: [Int] = Array(repeating: 0, count: s.count - 1)
        for (i, c) in s.enumerated().dropFirst() {
            let prev = Int(s[i - 1].asciiValue!)
            let cur = Int(c.asciiValue!)
            key[i - 1] = (cur - prev) % 26
        }
        return key
    }

    func key2(for s: String) -> [Character] {
        guard !s.isEmpty else { return Array(s) }
        let aAscii = Int(Character("a").asciiValue!)
        let shift = Int(s.first!.asciiValue!) - aAscii
        guard shift > 0 else { return Array(s) }
        var key: [Character] = Array(repeating: "a", count: s.count)
        for (i, c) in s.enumerated() {
            let cAscii = Int(c.asciiValue!)
            let val = aAscii + (26 + cAscii - aAscii - shift) % 26
            key[i] = Character(UnicodeScalar(val)!)
        }
        return key
    }
    
    func tests() {
        print(groupStrings(["abc", "bcd", "acef", "xyz", "az", "ba", "a", "z"]))
//         [
//              ["abc","bcd","xyz"],
//              ["az","ba"],
//              ["acef"],
//              ["a","z"]
//        ]
    }
}

