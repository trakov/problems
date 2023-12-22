class MaximumScoreAfterSplittingAString {
    func maxScore(_ s: String) -> Int {
        var result = s.first == "0" ? 1 : 0
        for c in s.dropFirst() where c == "1" {
            result += 1
        }
        var temp = result
        for c in s.dropFirst().dropLast() {
            temp += c == "0" ? 1 : -1
            result = max(result, temp)
        }
        return result
    }
    
    func tests() {
        print(maxScore("011101")) // 5
        print(maxScore("00111")) // 5
        print(maxScore("1111")) // 3
    }
}

