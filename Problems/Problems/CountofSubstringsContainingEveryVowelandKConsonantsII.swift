class CountofSubstringsContainingEveryVowelandKConsonantsII {
    func countOfSubstrings(_ word: String, _ k: Int) -> Int {
        let vowelSet = Set("aeiou")
        guard word.count >= vowelSet.count else { return 0 }
        let word = Array(word)
        var dict: [Character: Int] = [:]
        var count = 0
        var result = 0
        var left = 0
        var ind: [Character: Int] = [:]
        var ind_no: [Int] = []
        for right in 0..<word.count {
            if vowelSet.contains(word[right]) {
                dict[word[right], default: 0] += 1
                ind[word[right]] = right
            } else {
                count += 1
                ind_no.append(right)
            }
            while count > k {
                if vowelSet.contains(word[left]) {
                    dict[word[left], default: 0] -= 1
                    if dict[word[left]] == 0 {
                        dict[word[left]] = nil
                    }
                } else {
                    count -= 1
                }
                left += 1
            }
            if dict.count == 5 && count == k {
                let diff_no = k == 0 ? right : ind_no[ind_no.count - k]
                var dif_vol = Int.max
                for val in ind.values {
                    dif_vol = min(dif_vol, val)
                }
                let diff = min(diff_no, dif_vol) - left
                result += diff
                result += 1
            }
        }
        return result
    }
    
    func tests() {
        print(countOfSubstrings("aeioqq", 1)) // 0
        print(countOfSubstrings("aeiou", 0)) // 1
        print(countOfSubstrings("ieaouqqieaouqq", 1)) // 3
    }
}

