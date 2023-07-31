class LexicographicallySmallestEquivalentString {
    func smallestEquivalentString(_ s1: String, _ s2: String, _ baseStr: String) -> String {
        var map = Dictionary(uniqueKeysWithValues: "abcdefghijklmnopqrstuvwxyz".map {($0,$0)})
        
        func find(_ x: Character) -> Character {
            if x != map[x] {
                map[x] = find(map[x]!)
            }
            return map[x]!
        }
        
        for (a, b) in zip(s1, s2) {
            let (x,y) = (find(a), find(b))
            map[max(x,y)] = min(x,y)
        }
        
        return String(baseStr.map(find))
    }

    func tests() {
        print(smallestEquivalentString("parker", "morris", "parser"))//"makkek"
        print(smallestEquivalentString("hello", "world", "hold"))//"hdld"
        print(smallestEquivalentString("leetcode", "programs", "sourcecode"))//"aauaaaaada"
    }
}
