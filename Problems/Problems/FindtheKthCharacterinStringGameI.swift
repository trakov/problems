final class FindtheKthCharacterinStringGameI {
    func kthCharacter1(_ k: Int) -> Character {
        let letters = Array("abcdefghijklmnopqrstuvwxyz")
        var word: [Int] = [0]
        while word.count < k {
            word.append(contentsOf: word)
            for i in 0..<word.count/2 {
                word[i + word.count/2] = word[i] + 1
            }
        }
        return letters[word[k - 1] % letters.count]
    }
    
    func kthCharacter(_ k: Int) -> Character {
        var result = 0
        var t = 0
        var k = k
        while k != 1 {
            t = 1.leadingZeroBitCount - k.leadingZeroBitCount
            if (1 << t) == k {
                t -= 1
            }
            k = k - (1 << t)
            result += 1
        }
        return Character(UnicodeScalar(Int(Character("a").asciiValue!) + result)!)
    }
    
    func tests() {
        print(kthCharacter(5)) // b
        print(kthCharacter(10)) // c
    }
}
