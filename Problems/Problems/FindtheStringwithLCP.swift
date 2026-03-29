final class FindtheStringwithLCP {
    func findTheString(_ lcp: [[Int]]) -> String {
        let n = lcp.count
        var word: [UInt8] = Array(repeating: 0, count: n)
        var current: UInt8 = Character("a").asciiValue!
        for i in 0..<n {
            if word[i] == 0 {
                if current > Character("z").asciiValue! {
                    return ""
                }
                word[i] = current
                guard i < n - 1 else { continue }
                for j in i+1..<n {
                    if lcp[i][j] > 0 {
                        word[j] = word[i]
                    }
                }
                current += 1
            }
        }
        for i in (0...n-1).reversed() {
            for j in (0...n-1).reversed() {
                if word[i] != word[j] {
                    if lcp[i][j] != 0 {
                        return ""
                    }
                } else {
                    if i == n - 1 || j == n - 1 {
                        if lcp[i][j] != 1 {
                            return ""
                        }
                    } else {
                        if lcp[i][j] != lcp[i + 1][j + 1] + 1 {
                            return ""
                        }
                    }
                }
            }
        }
        return String(word.map { Character(UnicodeScalar($0)) })
    }
    
    func tests() {
        print(findTheString([[4,0,2,0],[0,3,0,1],[2,0,2,0],[0,1,0,1]])) // "abab"
        print(findTheString([[4,3,2,1],[3,3,2,1],[2,2,2,1],[1,1,1,1]])) // "aaaa"
        print(findTheString([[4,3,2,1],[3,3,2,1],[2,2,2,1],[1,1,1,3]])) // ""
    }
}
