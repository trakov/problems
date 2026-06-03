final class EarliestFinishTimeforLandandWaterRidesII {
    func earliestFinishTime(_ landStartTime: [Int], _ landDuration: [Int], _ waterStartTime: [Int], _ waterDuration: [Int]) -> Int {
        func solve(_ s1: [Int], _ d1: [Int], _ s2: [Int], _ d2: [Int]) -> Int {
            var finish1 = Int.max
            for (s, d) in zip(s1, d1) {
                finish1 = min(finish1, s + d)
            }
            var finish2 = Int.max
            for (s, d) in zip(s2, d2) {
                finish2 = min(finish2, max(s, finish1) + d)
            }
            return finish2
        }
        return min(
            solve(landStartTime, landDuration, waterStartTime, waterDuration),
            solve(waterStartTime, waterDuration, landStartTime, landDuration)
        )
    }
    
    func tests() {
        print(earliestFinishTime([2,8], [4,1], [6], [3])) // 9
        print(earliestFinishTime([5], [3], [1], [10])) // 14
    }
}
