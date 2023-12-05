class CountOfMatchesInTournament {
    func numberOfMatches(_ n: Int) -> Int {
        n - 1
    }

    func numberOfMatches2(_ n: Int) -> Int {
        if n == 1 { return 0 }
        return n / 2 + numberOfMatches(n / 2 + n % 2)
    }
    
    func tests() {
        print(numberOfMatches(7)) // 6
        print(numberOfMatches(14)) // 13
    }
}

