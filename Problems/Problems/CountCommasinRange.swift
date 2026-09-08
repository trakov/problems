final class CountCommasinRange {
    func countCommas(_ n: Int) -> Int {
        max(0, n - 999)
    }
    
    func tests() {
        print(countCommas(1002)) // 3
        print(countCommas(998)) // 0
    }
}
