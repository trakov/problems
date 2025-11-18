final class Onebitand2bitCharacters {
    func isOneBitCharacter(_ bits: [Int]) -> Bool {
        var i = 0
        while i < bits.count - 1 {
            i += bits[i] + 1
        }
        return i == bits.count - 1
    }
    
    func tests() {
        print(isOneBitCharacter([1,0,0])) // true
        print(isOneBitCharacter([1,1,1,0])) // false
    }
}
