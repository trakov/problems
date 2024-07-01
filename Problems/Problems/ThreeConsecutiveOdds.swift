class ThreeConsecutiveOdds {
    func threeConsecutiveOdds(_ arr: [Int]) -> Bool {
        var count = 0
        for num in arr {
            if num % 2 == 0 {
                count = 0
            } else {
                count += 1
                if count == 3 { return true }
            }
        }
        return false
    }
    
    func tests() {
        print(threeConsecutiveOdds([2,6,4,1])) // false
        print(threeConsecutiveOdds([1,2,34,3,4,5,7,23,12])) // true
    }
}

