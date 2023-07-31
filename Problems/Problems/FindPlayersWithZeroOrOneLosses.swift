class FindPlayersWithZeroOrOneLosses {
    func findWinners(_ matches: [[Int]]) -> [[Int]] {
        var winners: [Int: Bool] = [:] // gamer: isWinner
        var losers: [Int: Int] = [:] // loser: count
        
        for match in matches {
            let winner = match[0]
            let loser = match[1]
            if winners[winner] == nil {
                winners[winner] = true
            }
            winners[loser] = false
            losers[loser, default: 0] += 1
        }
        let resultWinners = winners.compactMap { $0.value ? $0.key : nil }.sorted()
        let onceLosers = losers.compactMap { $0.value == 1 ? $0.key : nil }.sorted()
        return [resultWinners, onceLosers]
    }

    func tests() {
        print(findWinners([[1,3],[2,3],[3,6],[5,6],[5,7],[4,5],[4,8],[4,9],[10,4],[10,9]])) // [[1,2,10],[4,5,7,8]]
        print(findWinners([[2,3],[1,3],[5,4],[6,4]])) // [[1,2,5,6],[]]
    }
}
