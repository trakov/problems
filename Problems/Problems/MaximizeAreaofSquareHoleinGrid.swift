final class MaximizeAreaofSquareHoleinGrid {
    func maximizeSquareHoleArea(_ n: Int, _ m: Int, _ hBars: [Int], _ vBars: [Int]) -> Int {
        let hBars = hBars.sorted()
        let vBars = vBars.sorted()
        var (hmax, vmax, hcur, vcur) = (1, 1, 1, 1)
        for i in 1..<hBars.count {
            if hBars[i] == hBars[i - 1] + 1 {
                hcur += 1
            } else {
                hcur = 1
            }
            hmax = max(hmax, hcur)
        }
        for i in 1..<vBars.count {
            if vBars[i] == vBars[i - 1] + 1 {
                vcur += 1
            } else {
                vcur = 1
            }
            vmax = max(vmax, vcur)
        }
        let side = min(hmax, vmax) + 1
        return side * side
    }
    
    func tests() {
        print(maximizeSquareHoleArea(2, 1, [2,3], [2])) // 4
        print(maximizeSquareHoleArea(1, 1, [2], [2])) // 4
        print(maximizeSquareHoleArea(2, 3, [2,3], [2,4])) // 4
    }
}
