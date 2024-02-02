class SequentialDigits {
    func sequentialDigits(_ low: Int, _ high: Int) -> [Int] {
        var result: [Int] = []
        for i in 1...9 {
            var num = i
            for j in i+1..<10 {
                num = num * 10 + j
                guard num <= high else { break }
                if num >= low {
                    result.append(num)
                }
            }
        }
        return result.sorted()
    }
    
    func tests() {
        print(sequentialDigits(100, 300)) // [123,234]
        print(sequentialDigits(1000, 13000)) // [1234,2345,3456,4567,5678,6789,12345]
    }
}

