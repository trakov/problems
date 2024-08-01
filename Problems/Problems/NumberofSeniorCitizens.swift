class NumberofSeniorCitizens {
    func countSeniors(_ details: [String]) -> Int {
        var result = 0
        for detail in details {
            let detail = Array(detail)
            let age = detail[11].wholeNumberValue! * 10 + detail[12].wholeNumberValue!
            if age > 60 { result += 1 }
        }
        return result
    }
    
    func tests() {
        print(countSeniors(
            ["7868190130M7522","5303914400F9211","9273338290F4010"]
        )) // 2
        print(countSeniors(
            ["1313579440F2036","2921522980M5644"]
        )) // 0
    }
}

