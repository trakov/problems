final class FourDivisors {
    func sumFourDivisors(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            var count = 0
            var sum = 0
            for divisorCandidate in 1...num {
                if num % divisorCandidate == 0 {
                    sum += divisorCandidate
                    count += 1
                }
                if count > 4 {
                    sum = 0
                    break
                }
            }
            if count == 4 {
                result += sum
            }
        }
        return result
    }
    
    func tests() {
        print(sumFourDivisors([7286,18704,70773,8224,91675]))
        print(sumFourDivisors([8])) // 15
        print(sumFourDivisors([21,4,7])) // 32
        print(sumFourDivisors([21,21])) // 64
        print(sumFourDivisors([1,2,3,4,5])) // 0
        print(sumFourDivisors([1,2,3,4,5,6,7,8,9,10])) // 45
    }
}
