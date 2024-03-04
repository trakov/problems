class BagOfTokens {
    func bagOfTokensScore(_ tokens: [Int], _ power: Int) -> Int {
        var score = 0
        var power = power
        let tokens = tokens.sorted()
        var i = 0
        var j = tokens.count - 1
        while i <= j {
            while i <= j && power >= tokens[i] {
                power -= tokens[i]
                score += 1
                i += 1
            }
            guard i < j else { break }
            guard tokens[i] < tokens[j] else { break }
            guard score > 0 else { break }
            power += tokens[j]
            score -= 1
            j -= 1
        }
        return score
    }
    
    func tests() {
        print(bagOfTokensScore([100], 50)) // 0
        print(bagOfTokensScore([200,100], 150)) // 1
        print(bagOfTokensScore([100,200,300,400], 200)) // 2
        print(bagOfTokensScore([26], 51)) // 1
    }
}

