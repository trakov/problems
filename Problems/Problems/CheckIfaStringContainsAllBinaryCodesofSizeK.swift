final class CheckIfaStringContainsAllBinaryCodesofSizeK {
    func hasAllCodes(_ s: String, _ k: Int) -> Bool {
        guard s.count >= k else { return false }
        var set: Set<Int> = []
        var cur = ""
        for c in s {
            cur.append(c)
            if cur.count == k {
                let num = Int(cur, radix: 2)!
                set.insert(num)
                cur.removeFirst()
            }
        }
        return set.count == 1 << k
    }
    
    func tests() {
        print(hasAllCodes("00110110", 2)) // true
        print(hasAllCodes("0110", 1)) // true
        print(hasAllCodes("0110", 2)) // false
    }
}
