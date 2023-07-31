class NimGame {
    func canWinNim(_ n: Int) -> Bool {
        return n % 4 != 0
    }

    func tests() {
        print(canWinNim(1)) // true
        print(canWinNim(2)) // true
        print(canWinNim(4)) // false
    }
}
