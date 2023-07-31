class MyCalendarI {
    private var ranges = [Range<Int>]()
    
    init() { }
    
    func book(_ start: Int, _ end: Int) -> Bool {
        let newRange = start..<end
        for range in ranges where range.overlaps(newRange) {
            return false
        }
        ranges.append(newRange)
        return true
    }

    func tests() {
        print(book(10, 20)) // true
        print(book(15, 25)) // true
        print(book(20, 30)) // true
    }
}
