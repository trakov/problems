class LongestHappyString {
    func longestDiverseString(_ a: Int, _ b: Int, _ c: Int) -> String {
        var (curra, currb, currc) = (0, 0, 0)
        var (a, b, c) = (a, b, c)
        let total = a + b + c
        var ans = ""

        for i in 0..<total {
            if (a >= b && a >= c && curra != 2) ||
                (a > 0 && (currb == 2 || currc == 2)) {
                ans.append("a")
                a -= 1
                curra += 1
                currb = 0
                currc = 0
            } else if (b >= a && b >= c && currb != 2) ||
                (b > 0 && (currc == 2 || curra == 2)) {
                ans.append("b")
                b -= 1
                currb += 1
                curra = 0
                currc = 0
            } else if (c >= a && c >= b && currc != 2) ||
                (c > 0 && (curra == 2 || currb == 2)) {
                ans.append("c")
                c -= 1
                currc += 1
                curra = 0
                currb = 0
            }
        }
        return ans
    }
    
    func tests() {
        print(longestDiverseString(1, 1, 7)) // ccaccbcc
        print(longestDiverseString(7, 1, 0)) // aabaa
    }
}

