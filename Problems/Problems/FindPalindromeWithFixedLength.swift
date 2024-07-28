class FindPalindromeWithFixedLength {
    func kthPalindrome(_ queries: [Int], _ intLength: Int) -> [Int] {
        let half = (intLength + 1) / 2
        var number = 1
        for _ in 0..<half - 1 {
            number *= 10
        }
        return queries.map {
            guard $0 <= number * 10 - number else { return -1 }
            let string = String(number + $0 - 1)
            return Int(
                string + ((intLength % 2 == 0) ? string.reversed() : string.dropLast().reversed())
            )!
        }
    }

    func tests() {
        print(kthPalindrome([1,2,3,4,5,90], 3)) // [101,111,121,131,141,999]
        print(kthPalindrome([2,4,6], 4)) // [1111,1331,1551]
    }
}

