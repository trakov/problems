class CountAllValidPickupAndDeliveryOptions {
    func countOrders(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        let mod = 1_000_000_007
        var result = 1
        for i in 2...n {
            let count = (i - 1) << 1
            result = result * (count + 1) * (count + 2) >> 1 % mod
        }
        return result
    }
    
    func tests() {
        print(countOrders(1)) // 1
        print(countOrders(2)) // 6
        print(countOrders(3)) // 90
    }
}

