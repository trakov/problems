final class FindtheMinimumAmountofTimetoBrewPotions {
    func minTime(_ skill: [Int], _ mana: [Int]) -> Int {
        let n = skill.count
        var times = Array(repeating: 0, count: n)
        for m in mana {
            var curTime = 0
            for (t, s) in zip(times, skill) {
                curTime = max(curTime, t) + s * m
            }
            times[n - 1] = curTime
            guard n > 1 else { continue }
            for i in (0...n-2).reversed() {
                times[i] = times[i + 1] - skill[i + 1] * m
            }
        }
        return times[n - 1]
    }
    
    func tests() {
        print(minTime([1,5,2,4], [5,1,4,2])) // 110
        print(minTime([1,1,1], [1,1,1])) // 5
        print(minTime([1,2,3,4], [1,2])) // 21
        print(minTime([1], [49]))
    }
}
