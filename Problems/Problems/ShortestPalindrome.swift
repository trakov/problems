class ShortestPalindrome {
    func shortestPalindrome(_ s: String) -> String {
        var hash = 0
        var revHash = 0
        let base = 5
        var powBase = 1
        var len = -1 // default to -1 in case `s` is empty

        for (i,ch) in s.utf8.map(Int.init).enumerated() {
            hash = hash &* base + ch
            revHash &+= powBase &* ch
            powBase &*= base
            len = hash == revHash ? i : len
        }

        return String(s.suffix(s.count-1-len).reversed()) + s
    }
    
    func tests() {
        print(shortestPalindrome("aacecaaa")) // aaacecaaa
        print(shortestPalindrome("abcd")) // dcbabcd
    }
}

