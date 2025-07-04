import Foundation
final class FindtheKthCharacterinStringGameII {
    func kthCharacter(_ k: Int, _ operations: [Int]) -> Character {
        var move = 0
        var k = Double(k)
        var count = pow(2, Double(operations.count))
        for op in operations.reversed() {
            count /= 2
            guard k > count else { continue }
            k -= count
            if op == 1 {
                move += 1
            }
        }
        move %= 26
        return Character(UnicodeScalar(Int(Character("a").asciiValue!) + move)!)
    }
    
    func tests() {
        print(kthCharacter(5, [0,0,0])) // "a"
        print(kthCharacter(10, [0,1,0,1])) // "b"
        print(kthCharacter(100000000000000, [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]))
    }
}
