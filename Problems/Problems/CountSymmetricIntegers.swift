final class CountSymmetricIntegers {
    func countSymmetricIntegers(_ low: Int, _ high: Int) -> Int {
        var result = 0
        for num in low...high {
            if num < 100, num % 11 == 0 { result += 1 }
            guard num > 999, num < 10000 else { continue }
            let x = num / 1000 + (num / 100) % 10
            let y = num % 10 + (num / 10) % 10
            if x == y { result += 1 }
        }
        return result
    }
    
    func tests() {
        print(countSymmetricIntegers(1, 100)) // 9
        print(countSymmetricIntegers(1200, 1230)) // 4
    }
}
