class CountOddNumbersInAnIntervalRange {
    func countOdds(_ low: Int, _ high: Int) -> Int {
        max(low % 2, high % 2) + (high - low) / 2
    }

    func tests() {
        print(countOdds(3, 3)) // 1
        print(countOdds(3, 6)) // 2
        print(countOdds(3, 7)) // 3
        print(countOdds(3, 8)) // 3
        print(countOdds(3, 9)) // 4
        print(countOdds(8, 8)) // 0
        print(countOdds(8, 10)) // 1
        print(countOdds(8, 11)) // 2
        print(countOdds(8, 12)) // 2
    }
}
