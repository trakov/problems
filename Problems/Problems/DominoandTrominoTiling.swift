final class DominoandTrominoTiling {
    func numTilings(_ n: Int) -> Int {
        if n < 3 {
            return n
        }
        var fp = 1, fc = 2, pc = 1
        for _ in 3...n {
            (fc, pc, fp) = ((fc + fp + 2*pc) % 1_000_000_007, (pc + fp) % 1_000_000_007, fc)
        }
        return fc
    }
    
    func tests() {
        print(numTilings(3)) // 5
        print(numTilings(1)) // 1
    }
}
