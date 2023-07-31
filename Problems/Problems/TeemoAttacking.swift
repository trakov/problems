class TeemoAttacking {
    func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
        var time = 0
        var prevT = timeSeries[0]
        for i in 1...timeSeries.count {
            if i == timeSeries.count {
                time += duration
                break
            }
            let t = timeSeries[i]
            time += min(duration, t - prevT)
            prevT = t
        }
        return time
    }

    func tests() {
        print(findPoisonedDuration([0,0,2,3,4,7], 2)) // 0 + 2 + 1 + 1 + 2 + 2
        print(findPoisonedDuration([1,4], 2)) // 2 + 2
        print(findPoisonedDuration([1,2], 2)) // 1 + 2
    }
}
