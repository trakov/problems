final class FindtheChildWhoHastheBallAfterKSeconds {
    func numberOfChild(_ n: Int, _ k: Int) -> Int {
        let passes = k / (n - 1)
        let moves = k % (n - 1)
        if passes % 2 == 0 {
            return moves
        } else {
            return n - 1 - moves
        }
    }
    
    func tests() {
        print(numberOfChild(3, 5)) // 1
        print(numberOfChild(5, 6)) // 2
        print(numberOfChild(4, 2)) // 2
    }
}
