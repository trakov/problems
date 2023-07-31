class FindTheWinnerOfTheCircularGame {
    func findTheWinner(_ n: Int, _ k: Int) -> Int {
        var result = Array(1...n)
        var i = k - 1
        while result.count > 1 {
            result.remove(at: i)
            i = (i + k - 1) % result.count
        }
        return result[0]
    }

    func findTheWinner2(_ n: Int, _ k: Int) -> Int {
        var result = (1...n).reduce(into: 0) { $0 ^= $1 }
        var i = k
        var n = n
        while result ^ i != 0 {
            result ^= i
            n -= 1
            i = (i + k) % n + 1
        }
        return result
    }
    
    func tests() {
        print(findTheWinner(5, 2)) // 3
        print(findTheWinner(6, 5)) // 1
    }
}

