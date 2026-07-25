final class MaximumProductofTwoDigits {
    func maxProduct(_ n: Int) -> Int {
        var (m1, m2) = (0, 0)
        for c in String(n) {
            let m = c.wholeNumberValue!
            if m > m1 {
                (m2, m1) = (m1, m)
            } else if m > m2 {
                m2 = m
            }
        }
        return m1 * m2
    }
    
    func tests() {
        print(maxProduct(31)) // 3
        print(maxProduct(22)) // 4
        print(maxProduct(124)) // 8
    }
}
