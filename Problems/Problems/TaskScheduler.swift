class TaskScheduler {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        guard n > 0 else { return tasks.count }
        var maxCount = 0
        var map: [Character: Int] = [:]
        for c in tasks {
            map[c, default: 0] += 1
            maxCount = max(maxCount, map[c]!)
        }
        var countOfMax = 0
        for count in map.values where count == maxCount {
            countOfMax += 1
        }
        return max(tasks.count, (maxCount - 1) * (n + 1) + countOfMax)
    }

    func leastInterval2(_ tasks: [Character], _ n: Int) -> Int {
        let taskCounts = tasks.reduce(into: [:]) { counts, task in
            counts[task, default: 0] += 1
        }
        var counts = taskCounts.values.sorted()
        let slots = counts.removeLast() - 1
        var idleTime = slots * n
        while idleTime > 0, let count = counts.popLast() {
            idleTime -= min(slots, count)
        }
        return tasks.count + max(0, idleTime)
    }

    func leastInterval1(_ tasks: [Character], _ n: Int) -> Int {
        guard n != 0 else { return tasks.count }
        var map: [Character: Int] = [:]
        for task in tasks {
            map[task, default: 0] += 1
        }
        var repeats = map.values.sorted()
        var count = 0
        while !repeats.isEmpty {
            let reps = repeats.count
            let k = min(reps, n+1)
            for i in 1...k {
                repeats[reps - i] -= 1
                if repeats[reps - i] == 0 {
                    repeats.remove(at: reps - i)
                }
                count += 1
            }
            repeats.sort()
            if repeats.count != 0 {
                count += (n-k+1)
            }
        }
        return count
    }

    func tests() {
        print(leastInterval(["A","A","A","B","B","B"], 2)) // 8
        print(leastInterval(["A","A","A","B","B","B"], 0)) // 6
        print(leastInterval(["A","A","A","B","B","B"], 1)) // 6
        print(leastInterval(["A","A","A","A","A","A","B","C","D","E","F","G"], 2)) // 16
        print(leastInterval(["A","A","A","B","B","B","C","C","C","D","D","E"], 2)) // 12
    }
}
