final class CountDaysSpentTogether {
    struct DM: Comparable {
        let d: Int
        let m: Int
        static func < (lhs: DM, rhs: DM) -> Bool {
            guard lhs.m == rhs.m else { return lhs.m < rhs.m }
            return lhs.d < rhs.d
        }
        func distance(_ to: DM) -> Int {
            guard self <= to else { return 0 }
            guard m != to.m else { return to.d - d + 1 }
            let daysPerMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
            var dist = daysPerMonth[m - 1] - d + 1 + to.d
            for month in stride(from: m + 1, through: to.m - 1, by: 1) {
                dist += daysPerMonth[month - 1]
            }
            return dist
        }
    }
    func countDaysTogether(_ arriveAlice: String, _ leaveAlice: String, _ arriveBob: String, _ leaveBob: String) -> Int {
        func parse(_ str: String) -> DM {
            let dm = str.split(separator: "-").map { Int($0)! }
            return DM(d: dm[1], m: dm[0])
        }
        let start = max(parse(arriveAlice), parse(arriveBob))
        let end = min(parse(leaveAlice), parse(leaveBob))
        return start.distance(end)
    }

    func tests() {
        print(countDaysTogether("08-15", "08-18", "08-16", "08-19")) // 3
        print(countDaysTogether("08-15", "08-18", "08-16", "08-16")) // 1
        print(countDaysTogether("10-01", "10-31", "11-01", "12-31")) // 0
        print(countDaysTogether("01-31", "03-01", "02-01", "03-02")) // 29
    }
}
