class ThekthFactorofn {
    func kthFactor(_ n: Int, _ k: Int) -> Int {
        var k = k
        for i in 1...n where n % i == 0 {
            k -= 1
            if k == 0 { return i }
        }
        return -1
    }
    
    func tests() {
        print(kthFactor(12, 3)) // 3
        print(kthFactor(7, 2)) // 7
        print(kthFactor(4, 4)) // -1
    }
}

