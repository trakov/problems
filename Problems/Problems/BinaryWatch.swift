final class BinaryWatch {
    func readBinaryWatch(_ turnedOn: Int) -> [String] {
        var result: [String] = []
        for h in 0..<12 {
            for m in 0..<60 {
                if h.nonzeroBitCount + m.nonzeroBitCount == turnedOn {
                    let str = String(format: "%d:%02d", h, m)
                    result.append(str)
                }
            }
        }
        return result
    }
    
    func tests() {
        print(readBinaryWatch(1))
        // ["0:01","0:02","0:04","0:08","0:16","0:32","1:00","2:00","4:00","8:00"]
        print(readBinaryWatch(9))
        // []
    }
}
