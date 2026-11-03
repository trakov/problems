final class MinimumMovestoEqualArrayElementsIII {
    func minMoves(_ nums: [Int]) -> Int {
        let m = nums.max()!
        return nums.reduce(0) { $0 + m - $1 }
    }
    
    func tests() {
        print(minMoves([2,1,3])) // 3
        print(minMoves([4,4,5])) // 2
    }
}
