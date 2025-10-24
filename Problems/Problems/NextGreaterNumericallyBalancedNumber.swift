final class NextGreaterNumericallyBalancedNumber {
    func nextBeautifulNumber(_ n: Int) -> Int {
        var list: [Int] = []
        var count = Array(repeating: 0, count: 8)
        func isBeautiful(_ count: [Int]) -> Bool {
            for d in 1...7 where count[d] != 0 && count[d] != d {
                return false
            }
            return true
        }
        func generate(_ num: Int) {
            if num > 0 && isBeautiful(count) {
                list.append(num)
            }
            if num > 1224444 { return }
            for d in 1...7 {
                if count[d] < d {
                    count[d] += 1
                    generate(num * 10 + d)
                    count[d] -= 1
                }
            }
        }
        generate(0)
        list.sort()
        for num in list where num > n {
            return num
        }
        return -1
    }
    
    func tests() {
        print(nextBeautifulNumber(1)) // 22
        print(nextBeautifulNumber(1000)) // 1333
        print(nextBeautifulNumber(3000)) // 3133
    }
}
