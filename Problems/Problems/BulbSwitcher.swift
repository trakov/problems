class BulbSwitcher {
    func bulbSwitch(_ n: Int) -> Int {
        Int(Double(n).squareRoot())
    }
    
    func tests() {
        print(bulbSwitch(3)) // 1
        print(bulbSwitch(1)) // 1
        print(bulbSwitch(0)) // 0
        print(bulbSwitch(4)) // 2
        print(bulbSwitch(10)) // 3
    }
}

