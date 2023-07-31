class WaterAndJugProblem {
    func canMeasureWater(_ jug1Capacity: Int, _ jug2Capacity: Int, _ targetCapacity: Int) -> Bool {
        guard jug1Capacity + jug2Capacity >= targetCapacity else { return false }
        var gcd = max(jug1Capacity, jug2Capacity)
        var x = min(jug1Capacity, jug2Capacity)
        while x != 0 {
            (gcd, x) = (x, gcd % x)
        }
        return targetCapacity % gcd == 0
    }
    
    func tests() {
        print(canMeasureWater(3, 5, 4)) // true
        print(canMeasureWater(2, 6, 5)) // false
        print(canMeasureWater(1, 2, 3)) // true
    }
}
