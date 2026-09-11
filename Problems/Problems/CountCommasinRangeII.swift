final class CountCommasinRangeII {
    func countCommas(_ n: Int) -> Int {
        var tousands = 1000
        var result = 0
        while tousands <= n {
            result += n - tousands + 1
            tousands *= 1000
        }
        return result
    }
    
    func tests() {
        print(countCommas(1002)) // 3
        print(countCommas(998)) // 0
    }
}
