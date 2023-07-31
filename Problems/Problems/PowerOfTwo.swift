import Foundation
class PowerOfTwo {
    func isPowerOfTwo(_ n: Int) -> Bool {
        guard n != 0 else { return false }
        
        return (n & (n-1) == 0)
        
        var temp = n
        while temp % 2 == 0 {
            temp /= 2
        }
        return temp == 1
    }

    func tests() {
        print(isPowerOfTwo(1)) // true
        print(isPowerOfTwo(16)) // true
        print(isPowerOfTwo(3)) // false
        print(isPowerOfTwo(5)) // false
        print(isPowerOfTwo(8)) // true

    }
}
