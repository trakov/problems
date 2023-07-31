class ArrangingCoins {
    func arrangeCoins(_ n: Int) -> Int {
        Int((-1 + Double(1 + 8 * n).squareRoot()) / 2)
    }

    func tests() {
        print(arrangeCoins(1)) // 1
        print(arrangeCoins(2)) // 1
        print(arrangeCoins(5)) // 2
        print(arrangeCoins(8)) // 3
        print(arrangeCoins(10)) // 4
        print(arrangeCoins(2146467959)) // 65519
    }
}
