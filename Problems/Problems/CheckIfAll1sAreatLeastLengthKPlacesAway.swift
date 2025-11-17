final class CheckIfAll1sAreatLeastLengthKPlacesAway {
    func kLengthApart(_ nums: [Int], _ k: Int) -> Bool {
        var lastIndex = -k - 1
        for (i, num) in nums.enumerated() {
            guard num == 1 else { continue }
            guard lastIndex < i - k else { return false }
            lastIndex = i
        }
        return true
    }
    
    func tests() {
        print(kLengthApart([1,0,0,0,1,0,0,1], 2)) // true
        print(kLengthApart([1,0,0,1,0,1], 2)) // false
    }
}
