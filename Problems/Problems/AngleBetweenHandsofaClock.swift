final class AngleBetweenHandsofaClock {
    func angleClock(_ hour: Int, _ minutes: Int) -> Double {
        let hAngle = Double((hour * 30) % 360) + Double(minutes) / 2.0
        let mAngle = Double(minutes * 6)
        let result = abs(hAngle - mAngle)
        return min(result, 360.0 - result)
    }
    
    func tests() {
        print(angleClock(12, 30)) // 165
        print(angleClock(3, 30)) // 75
        print(angleClock(3, 15)) // 7.5
    }
}
