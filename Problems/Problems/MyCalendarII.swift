class MyCalendarII {
    
    private var bookings: [Range<Int>] = []
    private var overlapBookings: [Range<Int>] = []
    
    private func doesOverlap(_ r1: Range<Int>, _ r2: Range<Int>) -> Bool {
        max(r1.lowerBound, r2.lowerBound) < min(r1.upperBound, r2.upperBound)
    }

    private func getOverlapped(_ r1: Range<Int>, _ r2: Range<Int>) -> Range<Int> {
        max(r1.lowerBound, r2.lowerBound)..<min(r1.upperBound, r2.upperBound)
    }

    func book(_ start: Int, _ end: Int) -> Bool {
        for booking in overlapBookings {
            if doesOverlap(booking, start..<end) {
                return false
            }
        }
        for booking in bookings {
            if doesOverlap(booking, start..<end) {
                overlapBookings.append(
                    getOverlapped(booking, start..<end)
                )
            }
        }
        bookings.append(start..<end)
        return true
    }

    func tests() {
        print(book(10, 20)) // true
        print(book(50, 60)) // true
        print(book(10, 40)) // true
        print(book(5, 15)) // false
        print(book(5, 10)) // true
        print(book(25, 55)) // true
    }
}

