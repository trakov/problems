final class WalkingRobotSimulationII {
    class Robot {
        enum Dir: String {
            case east = "East"
            case west = "West"
            case north = "North"
            case south = "South"
            
            func next() -> Dir {
                switch self {
                case .east: .north
                case .west: .south
                case .north: .west
                case .south: .east
                }
            }
        }
        private let width: Int
        private let height: Int
        private var x = 0
        private var y = 0
        private var dir: Dir = .east
        init(_ width: Int, _ height: Int) {
            self.width = width
            self.height = height
        }
        
        func step(_ num: Int) {
            let num = num % ((width + height - 2) * 2)
            let passed: Int
            switch dir {
            case .east:
                passed = min(num, width - 1 - x)
                x += passed
            case .west:
                passed = min(num, x)
                x -= passed
            case .north:
                passed = min(num, height - 1 - y)
                y += passed
            case .south:
                passed = min(num, y)
                y -= passed
            }
            if passed == num {
                if (x, y) == (0, 0) {
                    dir = .south
                }
                return
            }
            dir = dir.next()
            step(num - passed)
        }
        
        func getPos() -> [Int] {
            [x, y]
        }
        
        func getDir() -> String {
            dir.rawValue
        }
    }
    
    func tests() {
        let s = Robot(6, 3)
        s.step(2)
        s.step(2)
        print(s.getPos()) // [4, 0]
        print(s.getDir()) // East
        s.step(2)
        s.step(1)
        s.step(4)
        print(s.getPos()) // [1, 2]
        print(s.getDir()) // West
    }
}
