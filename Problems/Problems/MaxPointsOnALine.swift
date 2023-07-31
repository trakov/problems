class MaxPointsOnALine {
    struct Coef: Hashable {
        var dx: Int
        var dy: Int
        var b = 0
        
        init(p1: [Int], p2: [Int]) {
            let x1 = p1[0]
            let y1 = p1[1]
            let x2 = p2[0]
            let y2 = p2[1]
            dy = y2 - y1
            dx = x2 - x1
            b = y1 * dx - x1 * dy
            var gcd = findGCD(num1: abs(dy), num2: abs(dx))
            let sign = dx == 0 ? (dy < 0 ? -1 : 1) : (dx < 0 ? -1 : 1)
            gcd = findGCD(num1: gcd, num2: abs(b)) * sign
            dy /= gcd
            dx /= gcd
            b /= gcd
        }
        
        func findGCD(num1: Int, num2: Int) -> Int {
            var x = 0
            var y = max(num1, num2)
            var z = min(num1, num2)
            while z != 0 {
                x = y
                y = z
                z = x % y
            }
            return y
        }
    }
    
    func maxPoints(_ points: [[Int]]) -> Int {
        guard points.count > 2 else { return points.count }
        var map: [Coef: Set<Int>] = [:]
        var result = 0
        for i in 0..<points.count {
            for j in (i+1)..<points.count {
                let kb = Coef(p1: points[i], p2: points[j])
                map[kb, default: [i]].insert(j)
                result = max(result, map[kb]!.count)
            }
        }
        return result
    }
    
    func tests() {
        print(maxPoints([[2,3],[3,3],[-5,3]])) // 3
        print(maxPoints([[0,1],[0,0],[0,4],[0,-2],[0,-1],[0,3],[0,-4]])) // 7
        print(maxPoints([[1,1],[2,2],[3,3]])) // 3
        print(maxPoints([[1,1],[3,2],[5,3],[4,1],[2,3],[1,4]])) // 4
        print(maxPoints([[7,3],[19,19],[-16,3],[13,17],[-18,1],[-18,-17],[13,-3],[3,7],[-11,12],[7,19],[19,-12],[20,-18],[-16,-15],[-10,-15],[-16,-18],[-14,-1],[18,10],[-13,8],[7,-5],[-4,-9],[-11,2],[-9,-9],[-5,-16],[10,14],[-3,4],[1,-20],[2,16],[0,14],[-14,5],[15,-11],[3,11],[11,-10],[-1,-7],[16,7],[1,-11],[-8,-3],[1,-6],[19,7],[3,6],[-1,-2],[7,-3],[-6,-8],[7,1],[-15,12],[-17,9],[19,-9],[1,0],[9,-10],[6,20],[-12,-4],[-16,-17],[14,3],[0,-1],[-18,9],[-15,15],[-3,-15],[-5,20],[15,-14],[9,-17],[10,-14],[-7,-11],[14,9],[1,-1],[15,12],[-5,-1],[-17,-5],[15,-2],[-12,11],[19,-18],[8,7],[-5,-3],[-17,-1],[-18,13],[15,-3],[4,18],[-14,-15],[15,8],[-18,-12],[-15,19],[-9,16],[-9,14],[-12,-14],[-2,-20],[-3,-13],[10,-7],[-2,-10],[9,10],[-1,7],[-17,-6],[-15,20],[5,-17],[6,-6],[-11,-8]]))
    }
}
