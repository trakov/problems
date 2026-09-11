final class Unique3DigitEvenNumbers {
    func totalNumbers(_ digits: [Int]) -> Int {
        let n = digits.count
        var vis = Array(repeating: false, count: 1000)
        var result = 0
        for (i, d) in digits.enumerated() where d != 0 {
            for j in 0..<n where j != i {
                for k in 0..<n {
                    if k == i || k == j || digits[k] % 2 != 0 {
                        continue
                    }
                    let x = d * 100 + digits[j] * 10 + digits[k]
                    if !vis[x] {
                        vis[x] = true
                        result += 1
                    }
                }
            }
        }
        return result
    }
    
    func tests() {
        print(totalNumbers([1,2,3,4])) // 12
        print(totalNumbers([0,2,2])) // 2
        print(totalNumbers([6,6,6])) // 1
        print(totalNumbers([1,3,5])) // 0
    }
}
