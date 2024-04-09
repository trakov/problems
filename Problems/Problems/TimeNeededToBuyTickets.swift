class TimeNeededToBuyTickets {
    func timeRequiredToBuy(_ tickets: [Int], _ k: Int) -> Int {
        let cur = tickets[k]
        var result = 0
        for (i, ticket) in tickets.enumerated() {
            result += min(i <= k ? cur : cur - 1, ticket)
        }
        return result
    }
    
    func tests() {
        print(timeRequiredToBuy([2,3,2], 2)) // 6
        print(timeRequiredToBuy([2,3,2], 1)) // 7
        print(timeRequiredToBuy([2,3,2], 0)) // 4
        print(timeRequiredToBuy([5,1,1,1], 0)) // 8
    }
}

