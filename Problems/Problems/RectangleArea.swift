class RectangleArea {
    func computeArea(_ ax1: Int, _ ay1: Int, _ ax2: Int, _ ay2: Int, _ bx1: Int, _ by1: Int, _ bx2: Int, _ by2: Int) -> Int {
        let s1 = (ax2 - ax1) * (ay2 - ay1)
        let s2 = (bx2 - bx1) * (by2 - by1)
        
        let x = min(ax2, bx2) - max(ax1, bx1)
        let y = min(ay2, by2) - max(ay1, by1)
        let intersection = (x > 0 && y > 0) ? x * y : 0
        
        return s1 + s2 - intersection
    }

    func tests() {
        print(computeArea(-3, 0, 3, 4, 0, -1, 9, 2)) // 45
        print(computeArea(-2, -2, 2, 2, -2, -2, 2, 2)) // 45
    }
}
