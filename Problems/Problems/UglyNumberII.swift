class UglyNumberII {
    func nthUglyNumber(_ n: Int) -> Int {
        var uglyNumbers = Array(repeating: 0, count: n)
        uglyNumbers[0] = 1
        // Three pointers for the multiples of 2, 3, and 5
        var (indexMultipleOf2, indexMultipleOf3, indexMultipleOf5) = (0,0,0)
        var (nextMultipleOf2, nextMultipleOf3, nextMultipleOf5) = (2,3,5)
        // Generate ugly numbers until we reach the nth one
        for i in 1..<n {
            // Find the next ugly number as the minimum of the next multiples
            let nextUglyNumber = min(nextMultipleOf2,nextMultipleOf3,nextMultipleOf5)
            uglyNumbers[i] = nextUglyNumber
            // Update the corresponding pointer and next multiple
            if (nextUglyNumber == nextMultipleOf2) {
                indexMultipleOf2 += 1
                nextMultipleOf2 = uglyNumbers[indexMultipleOf2] * 2
            }
            if (nextUglyNumber == nextMultipleOf3) {
                indexMultipleOf3 += 1
                nextMultipleOf3 = uglyNumbers[indexMultipleOf3] * 3
            }
            if (nextUglyNumber == nextMultipleOf5) {
                indexMultipleOf5 += 1
                nextMultipleOf5 = uglyNumbers[indexMultipleOf5] * 5
            }
        }
        return uglyNumbers[n - 1]
    }
    
    func tests() {
        print(nthUglyNumber(1432)) // 612220032
        print(nthUglyNumber(11)) // 15
        print(nthUglyNumber(10)) // 12
        print(nthUglyNumber(1)) // 1
    }
}

