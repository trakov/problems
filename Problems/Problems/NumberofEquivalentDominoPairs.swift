final class NumberofEquivalentDominoPairs {
    func numEquivDominoPairs(_ dominoes: [[Int]]) -> Int {
        var map: [[Int] : Int] = [:]
        for domino in dominoes {
            let sortedDomino = domino.sorted()
            map[sortedDomino, default: 0] += 1
        }
        var result = 0
        for (_, count) in map {
            result += count * (count - 1) / 2
        }
        return result
    }
    
    func tests() {
        print(numEquivDominoPairs([[1,2],[2,1],[3,4],[5,6]])) // 1
        print(numEquivDominoPairs([[1,2],[1,2],[1,1],[1,2],[2,2]])) // 3
    }
}
