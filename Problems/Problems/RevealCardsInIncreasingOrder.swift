class RevealCardsInIncreasingOrder {
    func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
        let n = deck.count
        var queue = Array(0..<n)
        let deck = deck.sorted()
        var result = Array(repeating: 0, count: n)
        var j = 0
        for i in 0..<n {
            result[queue[j]] = deck[i]
            j += 1
            guard j < queue.count else { break }
            queue.append(queue[j])
            j += 1
        }
        return result
    }
    
    func tests() {
        print(deckRevealedIncreasing([17,13,11,2,3,5,7])) // [2,13,3,11,5,17,7]
        print(deckRevealedIncreasing([1,1000])) // [1,1000]
        print(deckRevealedIncreasing([1,2,3,4,5,6])) // [1,4,2,6,3,5]
    }
}

