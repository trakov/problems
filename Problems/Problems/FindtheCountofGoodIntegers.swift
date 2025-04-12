import math_h
final class FindtheCountofGoodIntegers {
    func countGoodIntegers(_ n: Int, _ k: Int) -> Int {
        let halfLength = (n + 1) / 2
        let minHalf = Int(pow(10.0, Double(halfLength - 1)))
        let maxHalf = Int(pow(10.0, Double(halfLength)))
        var ans = 0
        var seen = Set<String>()
        var factorial = Array(repeating: 1, count: n + 2)
        for i in 1...n+1 {
            factorial[i] = factorial[i - 1] * i
        }
        for num in minHalf..<maxHalf {
            let palindrome = String(num) + String(String(num).reversed()).dropFirst(n % 2)
            let sortedDigits = String(palindrome.sorted())
            if Int(palindrome)! % k != 0 || seen.contains(sortedDigits) {
                continue
            }
            seen.insert(sortedDigits)
            var digitCount = [Character: Int]()
            for char in palindrome {
                digitCount[char, default: 0] += 1
            }
            let firstDigitChoices = n - (digitCount["0"] ?? 0)
            var permutations = firstDigitChoices * factorial[n - 1]
            for freq in digitCount.values {
                permutations /= factorial[freq]
            }
            ans += permutations
        }
        return ans
    }

    func tests() {
        print(countGoodIntegers(3, 5)) // 27
        print(countGoodIntegers(1, 4)) // 2
        print(countGoodIntegers(5, 6)) // 2468
    }
}
