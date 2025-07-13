final class MaximumMatchingofPlayersWithTrainers {
    func matchPlayersAndTrainers(_ players: [Int], _ trainers: [Int]) -> Int {
        let players = players.sorted()
        let trainers = trainers.sorted()
        var result = 0
        var j = 0
        for player in players {
            while j < trainers.count, trainers[j] < player {
                j += 1
            }
            guard j < trainers.count else { break }
            result += 1
            j += 1
        }
        return result
    }
    
    func tests() {
        print(matchPlayersAndTrainers([4,7,9], [8,2,5,8])) // 2
        print(matchPlayersAndTrainers([1,1,1], [10])) // 1
    }
}
