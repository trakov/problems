final class LexicographicallySmallestPermutationGreaterThanTarget {
    func lexGreaterPermutation(_ s: String, _ target: String) -> String {
        func char(_ index: Int) -> Character {
            Character(UnicodeScalar(index + 97)!)
        }
        func index(_ char: Character) -> Int {
            .init(char.asciiValue! - 97)
        }
        func getMinString(_ cnt: [Int]) -> String {
            var res = ""
            for i in 0..<26 {
                res.append(contentsOf: String(repeating: char(i), count: cnt[i]))
            }
            return res
        }
        var cnt = Array(repeating: 0, count: 26)
        for (c, t) in zip(s, target) {
            cnt[index(c)] += 1
            cnt[index(t)] -= 1
        }
        var t = Array(target)
        for i in (0..<s.count).reversed() {
            let b = index(t[i])
            cnt[b] += 1
            if cnt.min()! < 0 {
                continue
            }
            for j in b+1..<26 {
                if cnt[j] > 0 {
                    cnt[j] -= 1
                    t[i] = char(j)
                    return String(t[0..<i+1]) + getMinString(cnt)
                }
            }
        }
        return "";
    }
    
    func tests() {
        print(lexGreaterPermutation("abc", "bba")) // "bca"
        print(lexGreaterPermutation("leet", "code")) // "eelt"
        print(lexGreaterPermutation("baba", "bbaa")) // ""
    }
}
