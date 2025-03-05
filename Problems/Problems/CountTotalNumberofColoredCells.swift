class CountTotalNumberofColoredCells {
    func coloredCells(_ n: Int) -> Int {
        2 * n * n - 2 * n + 1
    }
    
    func tests() {
        print(coloredCells(1)) // 1
        print(coloredCells(2)) // 5
        print(coloredCells(3)) // 13
    }
}

