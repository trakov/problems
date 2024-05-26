class StudentAttendanceRecordI {
    func checkRecord(_ s: String) -> Bool {
        var absentCount = 0
        var lateCount = 0
        for c in s {
            if c == "L" {
                lateCount += 1
                if lateCount > 2 { return false }
            } else {
                lateCount = 0
                if c == "A" {
                    absentCount += 1
                    if absentCount > 1 { return false }
                }
            }
        }
        return true
    }
    
    func tests() {
        print(checkRecord("PPALLP")) // true
        print(checkRecord("PPALLL")) // false
    }
}

