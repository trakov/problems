final class LexicographicallySmallestStringAfterApplyingOperations {
    func findLexSmallestString(_ s: String, _ a: Int, _ b: Int) -> String {
        var result = s
        let n = s.count
        var vis = Array(repeating: false, count: n)
        let s = Array(s + s)
        var i = 0
        while !vis[i] {
            vis[i] = true
            for j in 0..<10 {
                let kLimit = b % 2 == 0 ? 0 : 9
                for k in 0...kLimit {
                    var t = Array(s[i..<i+n])
                    for p in stride(from: 1, to: n, by: 2) {
                        let v = Int(Character("0").asciiValue!)
                        + (
                            Int(t[p].asciiValue!)
                            - Int(Character("0").asciiValue!)
                            + j * a
                        ) % 10
                        t[p] = Character(UnicodeScalar(v)!)
                    }
                    for p in stride(from: 0, to: n, by: 2) {
                        let v = Int(Character("0").asciiValue!)
                        + (
                            Int(t[p].asciiValue!)
                            - Int(Character("0").asciiValue!)
                            + k * a
                        ) % 10
                        t[p] = Character(UnicodeScalar(v)!)
                    }
                    result = min(result, String(t))
                }
            }
            i = (i + b) % n
        }
        return result
    }
    
    func tests() {
        print(findLexSmallestString("5525", 9, 2)) // "2050"
        print(findLexSmallestString("74", 5, 1)) // "24"
        print(findLexSmallestString("0011", 4, 2)) // "0011"
    }
}
