class MyCalendarI {
    private var ranges = [Range<Int>]()
    
    init() { }
    
    func book(_ start: Int, _ end: Int) -> Bool {
        var left = 0
        var right = ranges.count - 1
        while left <= right {
            let mid = (left + right) / 2
            let range = ranges[mid]
            if end <= range.lowerBound {
                right = mid - 1
            } else if start >= range.upperBound {
                left = mid + 1
            } else {
                return false
            }
        }
        ranges.insert(start..<end, at: left)
        return true
    }

    func tests() {
        print(book(20, 30)) // true
        print(book(0, 10)) // true
        print(book(10, 20)) // true
        print(book(15, 25)) // false
    }
}
