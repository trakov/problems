private extension Array {
    var startDay: Element { self[0] }
    var endDay: Element { self[1] }
    var value: Element { self[2] }
}

class MaximumNumberOfEventsThatCanBeAttendedII {
    func maxValue(_ events: [[Int]], _ k: Int) -> Int
    {
        let events = events.sorted{$0.startDay < $1.startDay}, n = events.count
        var memo: [Int:Int] = [:]

        func maxEventsSum(_ startEvent: Int, _ attend: Int) -> Int
        {
            let memoKey = startEvent * 1024 + attend
            if let res = memo[memoKey] { return res }

            var res = 0; defer { memo[memoKey] = res }

            if startEvent >= n || attend == 0 { return 0 }
            if startEvent == n-1 {
                res = events[n-1].value
                return res
            }
            if attend == 1 {
                res = events[startEvent...].max{$0.value < $1.value}!.value
                return res
            }
             
            let ignoreEventSum = maxEventsSum(startEvent + 1, attend)
            var attendEventSum = events[startEvent].value

            let eventLastDay = events[startEvent].endDay
            if eventLastDay < events.last!.startDay
            {
                var left = startEvent+1, right = n-1, mid: Int
                while left < right
                {
                    mid = (left + right) / 2
                    if events[mid].startDay > eventLastDay { right = mid }
                    else { left = mid + 1 }
                }
                attendEventSum += maxEventsSum(left, attend-1)
            }

            res = max(ignoreEventSum, attendEventSum)
            return res
        }

        return maxEventsSum(0, k)
    }
    
    func tests() {
//        print() //
    }
}
