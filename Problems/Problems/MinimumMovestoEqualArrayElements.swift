final class MinimumMovestoEqualArrayElements {
    func minMoves(_ nums: [Int]) -> Int {
        let m = nums.min()!
        return nums.reduce(0) { $0 + $1 - m }
    }
    
    func tests() {
        print(minMoves([1,2,3])) // 3
        print(minMoves([1,1,1])) // 0
    }
}
