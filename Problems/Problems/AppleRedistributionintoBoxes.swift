final class AppleRedistributionintoBoxes {
    func minimumBoxes(_ apple: [Int], _ capacity: [Int]) -> Int {
        var count = apple.reduce(0, +)
        var capacity = capacity.sorted()
        var result = 0
        while count > 0 {
            result += 1
            count -= capacity.removeLast()
        }
        return result
    }
    
    func tests() {
        print(minimumBoxes([1,3,2], [4,3,1,5,2])) // 2
        print(minimumBoxes([5,5,5], [2,4,2,7])) // 4
    }
}
