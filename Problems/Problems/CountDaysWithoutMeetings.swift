class CountDaysWithoutMeetings {
    func countDays(_ days: Int, _ meetings: [[Int]]) -> Int {
        let sorted = meetings.sorted { $0[0] < $1[0] }
        var meetCount = 0
        var (left, right) = (0, -1)
        for meet in sorted + [[days + 2, days + 1]] {
            if meet[0] > right + 1 {
                meetCount += right - left + 1
                left = meet[0]
            }
            right = max(right, meet[1])
        }
        return days - meetCount
    }
    
    func tests() {
        print(countDays(10, [[5,7],[1,3],[9,10]])) // 2
        print(countDays(5, [[2,4],[1,3]])) // 1
        print(countDays(6, [[1,6]])) // 0
    }
}
