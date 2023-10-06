import Foundation

class IntegerBreak {
    func integerBreak(_ n: Int) -> Int {
        guard n > 3 else { return n - 1 }
        let mod = n % 3
        let result: Decimal
        switch mod {
        case 0:
            result = pow(3, n / 3)
        case 1:
            result = pow(3, n / 3 - 1) * 4
        case 2:
            result = pow(3, n / 3) * 2
        default:
            fatalError()
        }
        return NSDecimalNumber(decimal: result).intValue
    }

    func integerBreak2(_ n: Int) -> Int {
        var dp = [0,1,1,2,4,6,9]
        
        while dp.count <= n {
            dp.append(dp[dp.count - 3] * 3)
        }
        
        return dp[n]
    }

    func tests() {
        print(integerBreak(2)) // 1
        print(integerBreak(4)) // 4
        print(integerBreak(5)) // 6
        print(integerBreak(10)) // 36
    }
}
