final class SimpleBankSystem {
    class Bank {
        private var balance: [Int]
        init(_ balance: [Int]) {
            self.balance = balance
        }
        
        func transfer(_ account1: Int, _ account2: Int, _ money: Int) -> Bool {
            guard account1 >= 1, account1 <= balance.count,
                  account2 >= 1, account2 <= balance.count else {
                return false
            }
            guard money <= balance[account1 - 1] else {
                return false
            }
            balance[account1 - 1] -= money
            balance[account2 - 1] += money
            return true
        }
        
        func deposit(_ account: Int, _ money: Int) -> Bool {
            guard account >= 1, account <= balance.count else { return false }
            balance[account - 1] += money
            return true
        }
        
        func withdraw(_ account: Int, _ money: Int) -> Bool {
            guard account >= 1, account <= balance.count else { return false }
            guard money <= balance[account - 1] else {
                return false
            }
            balance[account - 1] -= money
            return true
        }
    }

    func tests() {
        let bank = Bank([10, 100, 20, 50, 30])
        print(bank.withdraw(3, 10)) // true
        print(bank.transfer(5, 1, 20))// true
        print(bank.deposit(5, 20)) // true
        print(bank.transfer(3, 4, 15)) // false
        print(bank.withdraw(10, 50)) // false
    }
}
