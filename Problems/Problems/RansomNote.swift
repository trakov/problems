class RansomNote {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        guard ransomNote.count <= magazine.count else { return false }
        var m = magazine
        for s in ransomNote {
            guard let index = m.firstIndex(of: s) else { return false }
            m.remove(at: index)
        }
        
        return true
    }

    func tests() {
        print(canConstruct("a", "b")) // false
        print(canConstruct("aa", "ab")) // false
        print(canConstruct("aa", "aab")) // true
    }
}
