final class StoneRemovalGame {
    func canAliceWin(_ n: Int) -> Bool {
        var n = n
        var move = 10
        while n - move >= 0 {
            n -= move
            move -= 1
        }
        return move % 2 == 1
    }
    
    func tests() {
        print(canAliceWin(12)) // true
        print(canAliceWin(1)) // false
    }
}
