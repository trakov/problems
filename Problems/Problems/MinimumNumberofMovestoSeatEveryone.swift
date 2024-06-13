class MinimumNumberofMovestoSeatEveryone {
    // counting sort
    func minMovesToSeat(_ seats: [Int], _ students: [Int]) -> Int {
        let maxSeat = max(seats.max()!, students.max()!)
        var count = Array(repeating: 0, count: maxSeat + 1)
        for (seat, student) in zip(seats, students) {
            count[seat] += 1
            count[student] -= 1
        }
        var result = 0
        var diff = 0
        for c in count {
            result += abs(diff)
            diff += c
        }
        return result
    }

    func minMovesToSeat2(_ seats: [Int], _ students: [Int]) -> Int {
        let seats = seats.sorted()
        let students = students.sorted()
        var result = 0
        for (seat, student) in zip(seats, students) {
            result += abs(seat - student)
        }
        return result
    }
    
    func tests() {
        print(minMovesToSeat([3,1,5], [2,7,4])) // 4
        print(minMovesToSeat([4,1,5,9], [1,3,2,6])) // 7
        print(minMovesToSeat([2,2,6,6], [1,3,2,6])) // 4
        print(minMovesToSeat([12,14,19,19,12], [19,2,17,20,7])) // 19
    }
}

