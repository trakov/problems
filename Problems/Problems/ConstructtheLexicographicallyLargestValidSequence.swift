class ConstructtheLexicographicallyLargestValidSequence {
    func constructDistancedSequence(_ n: Int) -> [Int] {
        var result = Array(repeating: 0, count: n * 2 - 1)
        var isNumberUsed = Array(repeating: false, count: n + 1)
        func find(_ currentIndex: Int) -> Bool {
            if currentIndex == result.count {
                return true
            }
            if result[currentIndex] != 0 {
                return find(currentIndex + 1)
            }
            for numberToPlace in (1...n).reversed() {
                if isNumberUsed[numberToPlace] { continue }
                isNumberUsed[numberToPlace] = true
                result[currentIndex] = numberToPlace
                if numberToPlace == 1 {
                    if find(currentIndex + 1) {
                        return true
                    }
                } else if currentIndex + numberToPlace < result.count &&
                            result[currentIndex + numberToPlace] == 0 {
                    result[currentIndex + numberToPlace] = numberToPlace
                    if find(currentIndex + 1) {
                        return true
                    }
                    result[currentIndex + numberToPlace] = 0
                }
                result[currentIndex] = 0
                isNumberUsed[numberToPlace] = false
            }
            return false
        }
        find(0)
        return result
    }

    func tests() {
        print(constructDistancedSequence(3)) // [3,1,2,3,2]
        print(constructDistancedSequence(5)) // [5,3,1,4,3,5,2,4,2]
    }
}

