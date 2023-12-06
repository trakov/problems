class CalculateMoneyInLeetcodeBank {
    func totalMoney(_ n: Int) -> Int {
        let weeks = n / 7
        let day = n % 7
        func sum(_ num: Int) -> Int {
            num * (num + 1) / 2
        }
        return weeks * sum(7) + 7 * sum(weeks - 1)
        + sum(day) + day * weeks
    }
    
    func tests() {
        print(totalMoney(4)) // 10
        print(totalMoney(10)) // 37
        print(totalMoney(20)) // 96
    }
}
