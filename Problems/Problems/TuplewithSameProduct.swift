class TuplewithSameProduct {
    func tupleSameProduct(_ nums: [Int]) -> Int {
        guard nums.count > 3 else { return 0 }
        var products: [Int: Int] = [:]
        for (i, num) in nums.enumerated().dropLast() {
            for j in i+1..<nums.count {
                products[num * nums[j], default: 0] += 1
            }
        }
        var result = 0
        var map: [Int: Int] = [:]
        func factorial(_ n: Int) -> Int {
            if n == 0 || n == 1 { return 1 }
            if let res = map[n] { return res }
            let res = n * factorial(n - 1)
            map[n] = res
            return res
        }
        for count in products.values where count > 1 {
            result += (factorial(count) / (2 * factorial(count - 2)))
        }
        return result * 8
    }
    
    func tests() {
        print(tupleSameProduct([2,3,4,6])) // 8
        print(tupleSameProduct([1,2,4,5,10])) // 16
        print(tupleSameProduct([1,2,3,4,6,12])) // 40
    }
}

