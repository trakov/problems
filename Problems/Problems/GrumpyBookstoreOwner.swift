class GrumpyBookstoreOwner {
    func maxSatisfied(
        _ customers: [Int], _ grumpy: [Int], _ minutes: Int
    ) -> Int {
        let n = customers.count
        var result = 0
        for i in 0..<minutes {
            result += customers[i] * grumpy[i];
        }
        var temp = result
        for i in minutes..<n {
            temp += customers[i] * grumpy[i]
            temp -= customers[i - minutes] * grumpy[i - minutes]
            result = max(result, temp)
        }
        for (c, g) in zip(customers, grumpy) {
            result += c * (1 - g)
        }
        return result
    }
    
    func tests() {
        print(maxSatisfied([1,0,1,2,1,1,7,5], [0,1,0,1,0,1,0,1], 3)) // 16
        print(maxSatisfied([1], [0], 1)) // 1
    }
}
