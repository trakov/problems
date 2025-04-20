final class RabbitsinForest {
    func numRabbits(_ answers: [Int]) -> Int {
        var map: [Int: Int] = [:]
        for a in answers {
            map[a, default: 0] += 1
        }
        var result = 0
        for (key, val) in map {
            result += (val + key) / (key + 1) * (key + 1)
        }
        return result
    }
    
    func tests() {
        print(numRabbits([1,1,2])) // 5
        print(numRabbits([10,10,10])) // 11
    }
}
