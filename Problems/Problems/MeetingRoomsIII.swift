class MeetingRoomsIII {
    func mostBooked(_ n: Int, _ meetings: [[Int]]) -> Int {
        var roomAvailabilityTime = Array(repeating: 0, count: n)
        var meetingCount = Array(repeating: 0, count: n)
        let meetings = meetings.sorted(by: {$0[0] < $1[0]})
        for meeting in meetings {
            let start = meeting[0]
            let end = meeting[1]
            var minRoomAvailabilityTime = Int.max
            var minAvailableTimeRoom = 0
            var foundUnusedRoom = false
            for i in 0..<n {
                if roomAvailabilityTime[i] <= start {
                    foundUnusedRoom = true
                    meetingCount[i] += 1
                    roomAvailabilityTime[i] = end
                    break
                }
                if minRoomAvailabilityTime > roomAvailabilityTime[i] {
                    minRoomAvailabilityTime = roomAvailabilityTime[i]
                    minAvailableTimeRoom = i
                }
            }
            if !foundUnusedRoom {
                roomAvailabilityTime[minAvailableTimeRoom] += end - start
                meetingCount[minAvailableTimeRoom] += 1
            }
        }
        var maxMeetingCount = 0
        var maxMeetingCountRoom = 0
        for i in 0..<n {
            if meetingCount[i] > maxMeetingCount {
                maxMeetingCount = meetingCount[i]
                maxMeetingCountRoom = i
            }
        }
        return maxMeetingCountRoom
    }
    
    func tests() {
        print(mostBooked(2, [[0,10],[1,5],[2,7],[3,4]])) // 0
        print(mostBooked(3, [[1,20],[2,10],[3,5],[4,9],[6,8]])) // 1
    }
}

