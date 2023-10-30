import Foundation

class PoorPigs {
    func poorPigs(_ buckets: Int, _ minutesToDie: Int, _ minutesToTest: Int) -> Int {
        let states = minutesToTest / minutesToDie + 1
        let _buckets = log2(Double(buckets))
        let _states = log2(Double(states))
        return Int(ceil(_buckets / _states))
    }
    
    func tests() {
        print(poorPigs(4, 15, 15)) // 2
        print(poorPigs(4, 15, 30)) // 2
        print(poorPigs(125, 1, 4)) // 3
    }
}

