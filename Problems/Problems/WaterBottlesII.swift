import Foundation
final class WaterBottlesII {
    func maxBottlesDrunk(_ numBottles: Int, _ numExchange: Int) -> Int {
        var t = 0
        let empty = t * numExchange + (t * (t - 1)) / 2
        let total = numBottles + t
        let a = 1
        let b = 2 * numExchange - 3
        let c = -2 * numBottles
        t = Int(
            ceil((Double(-b) + Double(b * b - 4 * a * c).squareRoot()) / (2 * Double(a)))
        )
        return numBottles + t - 1
    }
    
    func tests() {
        print(maxBottlesDrunk(13, 6)) // 15
        print(maxBottlesDrunk(10, 3)) // 13
    }
}
