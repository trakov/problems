final class SmallestIntegerDivisiblebyK {
    func smallestRepunitDivByK(_ k: Int) -> Int {
        guard k % 2 != 0, k % 5 != 0 else { return -1 }
        var r = 0
        for l in 1...k {
            r = (r * 10 + 1) % k
            if r == 0 {
                return l
            }
        }
        return -1
    }
    
    func tests() {
        print(smallestRepunitDivByK(1)) // 1
        print(smallestRepunitDivByK(2)) // -1
        print(smallestRepunitDivByK(3)) // 3
    }
}
