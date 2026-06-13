final class WeightedWordMapping {
    func mapWordWeights(_ words: [String], _ weights: [Int]) -> String {
        func weight(_ c: Character) -> Int { weights[Int(c.asciiValue! - 97)] }
        func char(_ i: Int) -> Character { Character(UnicodeScalar(122 - i % 26)!) }
        return String(words.map { char($0.map(weight).reduce(0, +)) })
    }
    
    func tests() {
        print(mapWordWeights(["abcd","def","xyz"], [5,3,12,14,1,2,3,2,10,6,6,9,7,8,7,10,8,9,6,9,9,8,3,7,7,2])) // "rij"
        print(mapWordWeights(["a","b","c"], [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1])) // "yyy"
        print(mapWordWeights(["abcd"], [7,5,3,4,3,5,4,9,4,2,2,7,10,2,5,10,6,1,2,2,4,1,3,4,4,5])) // "g"
    }
}
