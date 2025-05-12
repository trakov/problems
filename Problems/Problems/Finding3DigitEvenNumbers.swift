final class Finding3DigitEvenNumbers {
    func findEvenNumbers(_ digits: [Int]) -> [Int] {
        var map: [Int: Int] = [:]
        for digit in digits {
            map[digit, default: 0] += 1
        }
        var result: [Int] = []
        for a in 1...9 {
            guard let ca = map[a] else { continue }
            map[a] = ca - 1
            for b in 0...9 {
                guard let cb = map[b], cb > 0 else { continue }
                map[b] = cb - 1
                for c in [0, 2, 4, 6, 8] {
                    guard let cc = map[c], cc > 0 else { continue }
                    let num = 100 * a + 10 * b + c
                    result.append(num)
                }
                map[b] = cb
            }
            map[a] = ca
        }
        return result
    }
    
    func tests() {
        print(findEvenNumbers([2,1,3,0])) // [102,120,130,132,210,230,302,310,312,320]
        print(findEvenNumbers([2,2,8,8,2])) // [222,228,282,288,822,828,882]
        print(findEvenNumbers([3,7,5])) // []
    }
}
