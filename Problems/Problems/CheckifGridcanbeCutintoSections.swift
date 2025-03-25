class CheckifGridcanbeCutintoSections {
    func checkValidCuts(_ n: Int, _ rectangles: [[Int]]) -> Bool {
        var sorted = rectangles.sorted { $0[0] < $1[0] }
        var count = 0
        var right = 0
        for interval in sorted + [[n,n,n,n]] {
            if interval[0] >= right {
                count += 1
                if count == 4 { return true }
            }
            right = max(right, interval[2])
        }
        count = 0
        right = 0
        sorted = rectangles.sorted { $0[1] < $1[1] }
        for interval in sorted + [[n,n,n,n]] {
            if interval[1] >= right {
                count += 1
                if count == 4 { return true }
            }
            right = max(right, interval[3])
        }
        return false
    }
    
    func tests() {
        print(checkValidCuts(5, [[1,0,5,2],[0,2,2,4],[3,2,5,3],[0,4,4,5]]))
        // true
        print(checkValidCuts(4, [[0,0,1,1],[2,0,3,4],[0,2,2,3],[3,0,4,3]]))
        // true
        print(checkValidCuts(4, [[0,2,2,4],[1,0,3,2],[2,2,3,4],[3,0,4,2],[3,2,4,4]]))
        // false
    }
}
