final class FindNumberswithEvenNumberofDigits {
    func findNumbers(_ nums: [Int]) -> Int {
        var result = 0
        for num in nums {
            if String(num).count % 2 == 0 {
                result += 1
            }
        }
        return result
    }
    
    func tests() {
        print(findNumbers([12,345,2,6,7896])) // 2
        print(findNumbers([555,901,482,1771])) // 1
    }
}
