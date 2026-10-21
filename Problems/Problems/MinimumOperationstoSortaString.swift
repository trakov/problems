final class MinimumOperationstoSortaString {
    func minOperations(_ s: String) -> Int {
        let n = s.count
        guard n > 1 else { return 0 }
        let (first, last) = (s.first!, s.last!)
        guard n > 2 else { return first <= last ? 0 : -1 }
        var (isFirst, isLast) = (true, true)
        var isSorted = true
        var prev = first
        var (mn, mx) = (first, last)
        var (fCount, lCount) = (0, 0)
        for c in s {
            if c == first { fCount += 1 }
            if c == last { lCount += 1 }
            if c < first { isFirst = false }
            if c > last { isLast = false }
            if c < prev { isSorted = false }
            prev = c
            mn = min(mn, c)
            mx = max(mx, c)
        }
        guard !isSorted else { return 0 }
        if isFirst || isLast { return 1 }
        if mn == last, mx == first, fCount == 1, lCount == 1 {
            return 3
        }
        return 2
    }
    
    func tests() {
        print(minOperations("dog")) // 1
        print(minOperations("card")) // 2
        print(minOperations("gf")) // -1
        print(minOperations("edc")) // 3
    }
}
