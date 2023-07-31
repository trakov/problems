class DesignParkingSystem {
    private var map: [Int: Int] // carType: available count
    init(_ big: Int, _ medium: Int, _ small: Int) {
        map = [
            1: big,
            2: medium,
            3: small
        ]
    }
    
    func addCar(_ carType: Int) -> Bool {
        if map[carType]! > 0 {
            map[carType]! -= 1
            return true
        } else {
            return false
        }
    }
    
    static func tests() {
        let c = DesignParkingSystem(1, 1, 0)
        print(c.addCar(1))
        print(c.addCar(2))
        print(c.addCar(3))
        print(c.addCar(1))
    }
}
