final class MaximizeActiveSectionwithTradeI {
    func maxActiveSectionsAfterTrade(_ s: String) -> Int {
        var ones = 0
        var zeros = 0
        var (prev, cur) = (0, 0)
        for c in s + "1" {
            if c == "1" {
                ones += 1
                if cur != 0 {
                    zeros = max(zeros, prev + cur)
                    (prev, cur) = (cur, 0)
                }
            } else {
                cur += 1
            }
        }
        if ones == 1 { return 0 }
        return ones - 1 + (prev == zeros ? 0 : zeros)
    }
    
    func tests() {
        print(maxActiveSectionsAfterTrade("01")) // 1
        print(maxActiveSectionsAfterTrade("0100")) // 4
        print(maxActiveSectionsAfterTrade("1000100")) // 7
        print(maxActiveSectionsAfterTrade("01010")) // 4
        print(maxActiveSectionsAfterTrade("1000101000")) // 7
        print(maxActiveSectionsAfterTrade("0")) // 0
        print(maxActiveSectionsAfterTrade("10")) // 1
        print(maxActiveSectionsAfterTrade("10110")) // 5
    }
}
