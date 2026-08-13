final class LongestSubstringofOneRepeatingCharacter {
    func longestRepeating(_ s: String, _ queryCharacters: String, _ queryIndices: [Int]) -> [Int] {
        let n = s.count
        let s = Array(s)
        var pre = Array(repeating: 0, count: 4 * n)
        var suf = Array(repeating: 0, count: 4 * n)
        var maxLen = Array(repeating: 0, count: 4 * n)
        var leftChar: [Character] = Array(repeating: "*", count: 4 * n)
        var rightChar: [Character] = Array(repeating: "*", count: 4 * n)
        func pushUp(_ u: Int, _ l: Int, _ r: Int) {
            let mid = (l + r) >> 1
            let leftLen = mid - l + 1
            let rightLen = r - mid
            let left = u << 1
            let right = (u << 1) | 1
            leftChar[u] = leftChar[left]
            rightChar[u] = rightChar[right]
            pre[u] = pre[left]
            if pre[left] == leftLen && rightChar[left] == leftChar[right] {
                pre[u] = pre[left] + pre[right]
            }
            suf[u] = suf[right]
            if suf[right] == rightLen && rightChar[left] == leftChar[right] {
                suf[u] = suf[right] + suf[left]
            }
            maxLen[u] = max(maxLen[left], maxLen[right])
            if rightChar[left] == leftChar[right] {
                maxLen[u] = max(maxLen[u], suf[left] + pre[right])
            }
        }
        func build(_ u: Int, _ l: Int, _ r: Int) {
            if l == r {
                pre[u] = 1
                suf[u] = 1
                maxLen[u] = 1
                leftChar[u] = s[l]
                rightChar[u] = s[l]
                return
            }
            let mid = (l + r) >> 1
            build(u << 1, l, mid)
            build((u << 1) | 1, mid + 1, r)
            pushUp(u, l, r)
        }
        func update(_ u: Int, _ l: Int, _ r: Int, _ pos: Int, _ ch: Character) {
            if l == r {
                leftChar[u] = ch
                rightChar[u] = ch
                return
            }
            let mid = (l + r) >> 1
            if pos <= mid {
                update(u << 1, l, mid, pos, ch)
            } else {
                update((u << 1) | 1, mid + 1, r, pos, ch)
            }
            pushUp(u, l, r)
        }
        build(1, 0, n - 1)
        var result = Array(repeating: 0, count: queryIndices.count)
        for (i, (qi, q)) in zip(queryIndices, queryCharacters).enumerated() {
            update(1, 0, n - 1, qi, q)
            result[i] = maxLen[1]
        }
        return result
    }
    
    func tests() {
        print(longestRepeating("babacc", "bcb", [1,3,3])) // [3,3,4]
        print(longestRepeating("abyzz", "aa", [2,1])) // [2,3]
    }
}
