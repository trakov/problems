import Foundation
class LetterCasePermutation {
    func letterCasePermutation(_ s: String) -> [String] {
        var result: [String] = []
        let s = Array(s)
        func dfs(_ temp: String, _ i: Int) {
            guard temp.count != s.count else { return result.append(temp) }
            let c = s[i]
            if c.isLetter {
                dfs(temp + String(c.uppercased()), i + 1)
                dfs(temp + String(c.lowercased()), i + 1)
            } else {
                dfs(temp + String(c), i + 1)
            }
        }
        dfs("", 0)
        return result
    }

    func letterCasePermutation2(_ s: String) -> [String] {
        let n = s.filter({$0.isLetter}).count
        var res = [String](repeating: "", count: Int(pow(2, Float(n))))
        var l = res.count
        for c in s {
            for i in 0..<res.count {
                if i % l < l / 2 {
                    res[i].append(c.lowercased())
                } else {
                    res[i].append(c.uppercased())
                }
            }
            l = c.isLetter ? l / 2 : l
        }
        return res
    }

    func tests() {
        print(letterCasePermutation("a1b2")) // ["a1b2","a1B2","A1b2","A1B2"]
        print(letterCasePermutation("3z4")) // ["3z4","3Z4"]
    }
}
