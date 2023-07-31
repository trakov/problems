class PowXN {
    func myPow(_ x: Double, _ n: Int) -> Double {
        if n == 1 { return x }
        if x.isZero { return 0 }
        if n == -1 { return 1/x }
        if n == 0 { return 1 }
        if x.isEqual(to: 1.0) { return 1 }
        let sign = n.signum()
        if x.isEqual(to: -1.0) { return n % 2 == 0 ? 1 : -1 }
        var pow = abs(n)
        var operations: [Bool] = []
        while pow > 0 {
            if pow % 2 == 0 {
                operations.append(true)
                pow /= 2
            } else {
                operations.append(false)
                pow -= 1
            }
        }
        var result = 1.0
        while let op = operations.popLast() {
            if op {
                result *= result
            } else {
                result *= x
            }
        }
        return sign == 1 ? result : 1/result
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    func myPow2(_ x: Double, _ n: Int) -> Double {
        if x.isEqual(to: 1.0) {
            return x
        } else if x.isEqual(to: -1.0) {
            return n % 2 == 0 ? 1.0 : -1.0
        }
        
        var operations = [Int]()
        var pow = abs(n)
        while pow != 0 {
            if pow % 2 == 0 {
                operations.append(0)
                pow /= 2
            } else {
                operations.append(1)
                pow -= 1
            }
        }
        var res = 1.0
        for op in operations.reversed() {
            if op == 0 {
                res *= res
            } else {
                if n > 0 {
                    res *= x
                } else {
                    res /= x
                }
            }
        }
        return res
    }

    func tests() {
        print(myPow(2.00000, 0)) // 1
        print(myPow(2.00000, 10)) // 1024.0
        print(myPow(2.10000, 3)) // 9.26100
        print(myPow(2.00000, -2)) // 0.25000
        print(myPow(0.0, -2))
        print(myPow(0.00001, 2147483647))
        print(myPow(1.00001, 1000))
        print(myPow(-1.00000, 2147483647))
        print(myPow(-1.00000, 2147483646))
        print(myPow(2.00000, -2147483648))
        print(myPow(0.999999999, -1000))
        print(myPow(0.999999999, -10000))
        print(myPow(0.999999999, -2147483648))
    }
}
