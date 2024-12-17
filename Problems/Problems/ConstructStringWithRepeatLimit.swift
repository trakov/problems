class ConstructStringWithRepeatLimit {
    func repeatLimitedString(_ s: String, _ repeatLimit: Int) -> String {
        var count = Array(repeating: 0, count: 26)
        for c in s {
            let index = Int(c.asciiValue! - Character("a").asciiValue!)
            count[index] += 1
        }
        var result = ""
        var index = 25
        while index >= 0 {
            guard count[index] > 0 else { index -= 1; continue }
            let use = min(count[index], repeatLimit)
            let char = Character(UnicodeScalar(Int(Character("a").asciiValue!) + index)!)
            result.append(String(repeating: char, count: use))
            count[index] -= use
            if count[index] > 0 {
                var nextIndex = index - 1
                while nextIndex >= 0 && count[nextIndex] == 0 {
                    nextIndex -= 1
                }
                guard nextIndex >= 0 else { break }
                result.append(Character(UnicodeScalar(Int(Character("a").asciiValue!) + nextIndex)!))
                count[nextIndex] -= 1
            }
        }
        return result
    }
    
    func tests() {
        print(repeatLimitedString("cczazcc", 3)) // "zzcccac"
        print(repeatLimitedString("aababab", 2)) // "bbabaa"
    }
}

