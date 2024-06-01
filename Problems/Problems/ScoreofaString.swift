class ScoreofaString {
    func scoreOfString(_ s: String) -> Int {
        let s = Array(s)
        var result = 0
        for i in 1..<s.count {
            result += abs(Int(s[i - 1].asciiValue!) - Int(s[i].asciiValue!))
        }
        return result
    }
    
    func tests() {
        print(scoreOfString("hello")) // 13
        print(scoreOfString("zaz")) // 50
    }
}

