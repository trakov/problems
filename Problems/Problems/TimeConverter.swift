// hackerrank
class TimeConverter {
    func timeConversion(s: String) -> String {
        var result = Array(s.prefix(s.count - 2))
        let isAM = s.hasSuffix("AM")
        let hours = Int(s.prefix(2))! % 12 + (isAM ? 0 : 12)
        result[0] = Character("\(hours / 10)")
        result[1] = Character("\(hours % 10)")
        return String(result)
    }
    
    func tests() {
        print(timeConversion(s: "01:05:45PM")) // 13:05:45
        print(timeConversion(s: "01:05:45AM")) // 01:05:45
        
        print(timeConversion(s: "07:05:45PM")) // 19:05:45
        print(timeConversion(s: "07:05:45AM")) // 07:05:45
        print(timeConversion(s: "12:05:45PM")) // 12:05:45
        print(timeConversion(s: "12:05:45AM")) // 00:05:45
    
        print(timeConversion(s: "11:05:45PM")) // 23:05:45
        print(timeConversion(s: "11:05:45AM")) // 11:05:45
    }
}

