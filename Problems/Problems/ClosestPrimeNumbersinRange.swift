class ClosestPrimeNumbersinRange {
    func closestPrimes(_ left: Int, _ right: Int) -> [Int] {
        guard right - left >= 1 else { return [-1,-1] }
        var sieveArray = sieve(right)
        var primeNumbers: [Int] = []
        for num in left...right {
            if sieveArray[num] == 1 {
                primeNumbers.append(num)
            }
        }
        guard primeNumbers.count >= 2 else { return [-1,-1] }
        var minDifference = Int.max
        var closestPair = [-1, -1]
        for index in 1..<primeNumbers.count {
            let difference = primeNumbers[index] - primeNumbers[index - 1]
            if difference < minDifference {
                minDifference = difference
                closestPair[0] = primeNumbers[index - 1]
                closestPair[1] = primeNumbers[index]
            }
        }
        return closestPair
    }

    func sieve(_ upperLimit: Int) -> [Int] {
        var sieve = Array(repeating: 1, count: upperLimit + 1)
        sieve[0] = 0
        sieve[1] = 0
        for number in 2...Int(Double(upperLimit).squareRoot()) {
            if sieve[number] == 1 {
                for multiple in number...upperLimit/number {
                    sieve[multiple * number] = 0
                }
            }
        }
        return sieve
    }
    
    func tests() {
        print(closestPrimes(1, 1)) // [-1,-1]
        print(closestPrimes(10, 19)) // [11,13]
        print(closestPrimes(4, 6)) // [-1,-1]
    }
}
