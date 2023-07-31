class IncreasingTripletSubsequence {
    func increasingTriplet(_ nums: [Int]) -> Bool {
        guard nums.count > 2 else { return false }
        var a = Int.max
        var b = Int.max
        for num in nums {
            if num <= a {
                a = num
            } else if num <= b {
                b = num
            } else if num > b {
                print(a, b, num)
                return true
            }
        }
        return false
    }
    
    func tests() {
        print(increasingTriplet([5,4,3,2,6,1,4])) // false
        print(increasingTriplet([5,4,3,4,6,1,4])) // true
        print(increasingTriplet([1,2,3,4,5])) // true
        print(increasingTriplet([5,4,3,2,1])) // false
        print(increasingTriplet([2,1,5,0,4,6])) // true
    }
}

