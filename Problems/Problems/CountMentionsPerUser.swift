final class CountMentionsPerUser {
    func countMentions(_ numberOfUsers: Int, _ events: [[String]]) -> [Int] {
        var result = Array(repeating: 0, count: numberOfUsers)
        let events = events.sorted { a, b in
            let timeA = Int(a[1])!
            let timeB = Int(b[1])!
            if timeA != timeB {
                return timeA < timeB
            }
            return a[0] > b[0]
        }
        var all = 0
        var nextOnlineTime = Array(repeating: 0, count: numberOfUsers)
        for event in events {
            let curTime = Int(event[1])!
            switch event[0] {
            case "MESSAGE":
                let target = event[2]
                switch target {
                case "ALL": all += 1
                case "HERE":
                    for i in 0..<numberOfUsers where nextOnlineTime[i] <= curTime {
                        result[i] += 1
                    }
                default:
                    let ids = target.split(separator: " ")
                    for id in ids {
                        let i = Int(id.dropFirst(2))!
                        result[i] += 1
                    }
                }
            default:
                let i = Int(event[2])!
                nextOnlineTime[i] = curTime + 60
            }
        }
        for i in 0..<numberOfUsers {
            result[i] += all
        }
        return result
    }
    
    func tests() {
        print(countMentions(2, [["MESSAGE","10","id1 id0"],["OFFLINE","11","0"],["MESSAGE","71","HERE"]])) // [2,2]
        print(countMentions(2, [["MESSAGE","10","id1 id0"],["OFFLINE","11","0"],["MESSAGE","12","ALL"]])) // [2,2]
        print(countMentions(2, [["OFFLINE","10","0"],["MESSAGE","12","HERE"]])) // [0,1]
        print(countMentions(3, [["MESSAGE","1","ALL"],["OFFLINE","66","1"],["MESSAGE","66","HERE"],["OFFLINE","5","1"]])) // [2,1,2]
        print(countMentions(3, [["MESSAGE","2","HERE"],["OFFLINE","2","1"],["OFFLINE","1","0"],["MESSAGE","61","HERE"]])) // [1,0,2]
    }
}
