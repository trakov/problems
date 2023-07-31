class HammingDistance {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        guard x != y else { return 0 }
        let xb = String(x, radix: 2)
        let yb = String(y, radix: 2)
        
        
        
        return (x^y).nonzeroBitCount
    }

    func tests() {
        print(hammingDistance(1, 4)) // 2 // 0001 0100
        print(hammingDistance(3, 1)) // 1 // 0011 0001
    }
}
