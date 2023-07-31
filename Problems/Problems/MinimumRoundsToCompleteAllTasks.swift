class MinimumRoundsToCompleteAllTasks {
    func minimumRounds(_ tasks: [Int]) -> Int {
        guard tasks.count > 1 else { return -1 }
        var map: [Int: Int] = [:] // task: count
        for task in tasks {
            map[task, default: 0] += 1
        }
        var count = 0
        for (_, c) in map {
            guard c > 1 else { return -1 }
            count += c / 3 + (c % 3 == 0 ? 0 : 1)
        }
        return count
    }

    func tests() {
        print(minimumRounds([2,2,3,3,2,4,4,4,4,4])) // 4
        print(minimumRounds([2,3,3])) // -1
    }
}
