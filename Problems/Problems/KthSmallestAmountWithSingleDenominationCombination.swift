final class KthSmallestAmountWithSingleDenominationCombination {
    func findKthSmallest(_ coins: [Int], _ k: Int) -> Int {
        func gcd(_ a: Int, _ b: Int) -> Int {
            b == 0 ? a : gcd(b, a % b)
        }
        
        func count(_ x: Int, _ m: Int, _ lcm: [Int], _ bitCount: [Int]) -> Int {
            var result = 0
            for mask in 1..<m {
                if lcm[mask] > x {
                    continue
                }
                if bitCount[mask] & 1 == 1 {
                    result += x / lcm[mask]
                } else {
                    result -= x / lcm[mask]
                }
            }
            return result
        }
        
        let sortedCoins = coins.sorted()
        var filteredCoins: [Int] = []
        for x in sortedCoins {
            var shouldAdd = true
            for y in filteredCoins {
                if x % y == 0 {
                    shouldAdd = false
                    break
                }
            }
            if shouldAdd {
                filteredCoins.append(x)
            }
        }
        
        let coins = filteredCoins
        let n = coins.count
        let m = 1 << n
        var bitCount = Array(repeating: 0, count: m)
        var lcm = Array(repeating: 0, count: m)
        var left = k
        var right = coins[0] * k + 1
        
        for mask in 1..<m {
            bitCount[mask] = bitCount[mask >> 1] + (mask & 1)
        }
        
        lcm[0] = 1
        for mask in 1..<m {
            let preMask = mask & (mask - 1)
            let i = mask.trailingZeroBitCount
            let value = lcm[preMask] / gcd(lcm[preMask], coins[i])
            
            if value <= right / coins[i] {
                lcm[mask] = value * coins[i]
            } else {
                lcm[mask] = right + 1
            }
        }
        
        while left < right {
            let x = left + (right - left) / 2
            if count(x, m, lcm, bitCount) >= k {
                right = x
            } else {
                left = x + 1
            }
        }
        return left
    }
    
    func tests() {
        print(findKthSmallest([3,6,9], 3)) // 9
        print(findKthSmallest([5,2], 7)) // 12
    }
}
