class CoinChange {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        guard coins.count > 1 else {
            if amount % coins[0] == 0 { return amount / coins[0] }
            return -1
        }
        var result = [Int](repeating: amount + 1, count: amount + 1)
        result[0] = 0
        for i in 1..<amount + 1 {
            for c in coins {
                if c <= i {
                    result[i] = min(result[i], result[i - c] + 1)
                }
            }
        }
        return result[amount] > amount ? -1 : result[amount]
    }

    func coinChange2(_ coins: [Int], _ amount: Int) -> Int {
        guard coins.count > 1 else {
            if amount % coins[0] == 0 { return amount / coins[0] }
            return -1
        }
        var f = Array(repeating: 0, count: coins.count)
        let coins = coins.sorted(by: >)
        var leftAmount = amount
        var i = 0
        while leftAmount != 0 {
            while coins[i] <= leftAmount {
                f[i] += 1
                leftAmount -= coins[i]
            }
            if leftAmount == 0 { break }
            i += 1
            while i == f.count {
                var lastI = f.count - 1
                while f[lastI] == 0 {
                    lastI -= 1
                }
                f[lastI] -= 1
                leftAmount += coins[lastI]
                i = lastI + 1
            }
        }
        
        return leftAmount == 0 ? f.reduce(0) { $0 + $1 } : -1
    }

    func tests() {
        print(coinChange([186,419,83,408], 6249)) //
        print(coinChange([1,2,5], 11)) // 3
        print(coinChange([2], 3)) // -1
        print(coinChange([1], 0)) // 0
    }
}
