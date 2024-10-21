class SplitaStringIntotheMaxNumberofUniqueSubstrings {
    func maxUniqueSplit(_ s: String) -> Int {
        var seen: Set<ArraySlice<Character>> = []
        var maxCount = [1]
        let s = Array(s)
        let n = s.count
        func backtrack(_ start: Int, _ count: Int) {
            if count + (n - start) <= maxCount[0] { return }
            if start == n {
                maxCount[0] = max(maxCount[0], count)
                return
            }
            for end in start+1...n {
                let substring = s[start..<end]
                if !seen.contains(substring) {
                    seen.insert(substring)
                    backtrack(end, count + 1)
                    seen.remove(substring)
                }
            }
        }
        backtrack(0, 0)
        return maxCount[0]
    }

    func tests() {
        print(maxUniqueSplit("ababccc")) // 5
        print(maxUniqueSplit("aba")) // 2
        print(maxUniqueSplit("aa")) // 1
    }
}

