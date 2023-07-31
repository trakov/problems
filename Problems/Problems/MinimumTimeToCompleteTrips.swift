class MinimumTimeToCompleteTrips {
    func minimumTime3(_ time: [Int], _ totalTrips: Int) -> Int {
        var left = 0
        var right = time.min()! * totalTrips
        while left < right {
            let mid = (left + right) / 2
            var trips = 0
            for busTime in time {
                trips += mid/busTime
            }
            if trips >= totalTrips {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }

    func minimumTime(_ time: [Int], _ totalTrips: Int) -> Int {
        var map: [Int: Int] = [:] // time: number of buses
        for t in time {
            map[t, default: 0] += 1
        }
        var left = 0
        var right = time.min()! * totalTrips
        while left < right {
            let mid = (left + right) / 2
            var trips = 0
            for (busTime, count) in map {
                trips += (mid/busTime) * count
            }
            if trips >= totalTrips {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }

    func minimumTime2(_ time: [Int], _ totalTrips: Int) -> Int {
        var map: [Int: Int] = [:] // time: number of buses
        for t in time {
            map[t, default: 0] += 1
        }
        let busTimes = map.keys.sorted()
        var left = 0
        var right = busTimes[0] * totalTrips
        while left < right {
            let mid = (left + right) / 2
            var trips = 0
            for busTime in busTimes {
                trips += (mid/busTime) * map[busTime]!
            }
            if trips >= totalTrips {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }

    func tests() {
        print(minimumTime([1,2,3], 5)) // 3
        print(minimumTime([2], 1)) // 2
    }
}
