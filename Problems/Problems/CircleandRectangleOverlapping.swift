import Foundation
final class CircleandRectangleOverlapping {
    func checkOverlap(_ radius: Int, _ xCenter: Int, _ yCenter: Int, _ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Bool {
        func intPow(_ a: Int, _ b: Int) -> Int {
            Int(pow(Double(a), Double(b)))
        }
        var dist = 0
        if xCenter < x1 || xCenter > x2 {
            dist += min(
                intPow(x1 - xCenter, 2),
                intPow(x2 - xCenter, 2)
            )
        }
        if yCenter < y1 || yCenter > y2 {
            dist += min(
                intPow(y1 - yCenter, 2),
                intPow(y2 - yCenter, 2)
            )
        }
        return dist <= radius * radius
    }
    
    func tests() {
        print(checkOverlap(1, 0, 0, 1, -1, 3, 1)) // true
        print(checkOverlap(1, 1, 1, 1, -3, 2, -1)) // false
        print(checkOverlap(1, 0, 0, -1, 0, 0, 1)) // true
    }
}
