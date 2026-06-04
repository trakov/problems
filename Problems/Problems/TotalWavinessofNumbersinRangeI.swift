final class TotalWavinessofNumbersinRangeI {
    func totalWaviness(_ num1: Int, _ num2: Int) -> Int {
        guard num2 > 100 else { return 0 }
        let num1 = max(num1, 101)
        var result = 0
        func waves(_ num: Int) -> Int {
            var count = 0
            let num = String(num).map { Int(String($0))! }
            for (i, d) in num.enumerated().dropFirst().dropLast() {
                let sgn1 = (d - num[i - 1]).signum()
                let sgn2 = (d - num[i + 1]).signum()
                if sgn1 != 0 && sgn1 == sgn2 {
                    count += 1
                }
            }
            return count
        }
        for num in num1...num2 {
            result += waves(num)
        }
        return result
    }
    
    func tests() {
        print(totalWaviness(120, 130)) // 3
        print(totalWaviness(198, 202)) // 3
        print(totalWaviness(4848, 4848)) // 2
    }
}
