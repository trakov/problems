final class MaximumNumberofNonOverlappingSubstrings {
    func maxNumOfSubstrings(_ s: String) -> [String] {
        let a = Array(s), n = a.count
        var L = Array(repeating: -1, count: 26), R = Array(repeating: -1, count: 26)
        for i in 0..<n { let c = Int(a[i].asciiValue! - 97); if L[c] < 0 { L[c] = i }; R[c] = i }
        var ivs = [(r: Int, l: Int)]()
        for i in 0..<26 {
            if L[i] < 0 { continue }
            var l = L[i], r = R[i], ok = true, j = l
            while j <= r && ok {
                let c = Int(a[j].asciiValue! - 97)
                if L[c] < l { ok = false } else { r = max(r, R[c]); j += 1 }
            }
            if ok { ivs.append((r, l)) }
        }
        ivs.sort { $0.r < $1.r }
        var res = [String](), last = -1
        for iv in ivs where iv.l > last { res.append(String(a[iv.l...iv.r])); last = iv.r }
        return res
    }
    
    func tests() {
        print(maxNumOfSubstrings("adefaddaccc")) // ["e","f","ccc"]
        print(maxNumOfSubstrings("abbaccd")) // ["d","bb","cc"]
    }
}
