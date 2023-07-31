class LemonadeChange {
    func lemonadeChange(_ bills: [Int]) -> Bool {
        var five = 0
        var ten = 0
        
        for bill in bills {
            if bill == 5 {
                five += 1
            } else if bill == 10 {
                if five == 0 { return false }
                five -= 1
                ten += 1
            } else {
                var fiveCount = 3
                if ten > 0 {
                    ten -= 1
                    fiveCount -= 2
                }
                if five < fiveCount { return false }
                five -= fiveCount
            }
        }
        
        return true
    }
    
    func tests() {
        print(lemonadeChange([5,5,5,10,20])) // true
        print(lemonadeChange([5,5,10,10,20])) // false
    }
}

