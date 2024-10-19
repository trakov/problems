class FindKthBitinNthBinaryString {
    func findKthBit(_ n: Int, _ k: Int) -> Character {
        var invertCount = 0
        var len = (1 << n) - 1
        var k = k
        while k > 1 {
            if k == len / 2 + 1 {
                return invertCount % 2 == 0 ? "1" : "0"
            }
            if k > len / 2 {
                k = len + 1 - k
                invertCount += 1
            }
            len /= 2
        }
        return invertCount % 2 == 0 ? "0" : "1"
    }
    
    func tests() {
        print(findKthBit(3, 1)) // "0"
        print(findKthBit(4, 11)) // "1"
    }
}
