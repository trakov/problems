class LastMomentBeforeAllAntsFallOutOfAPlank {
    func getLastMoment(_ n: Int, _ left: [Int], _ right: [Int]) -> Int {
        return max(left.max() ?? 0, n - (right.min() ?? n))
    }
    
    func tests() {
        print(getLastMoment(4, [4,3], [0,1])) // 4
        print(getLastMoment(7, [0,1,2,3,4,5,6,7], [])) // 7
    }
}

