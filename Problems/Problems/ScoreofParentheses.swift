final class ScoreofParentheses {
    func scoreOfParentheses(_ s: String) -> Int {
        var result = 0
        var balance = 0
        var prev: Character = "*"
        for c in s {
            if c == "(" {
                balance += 1
            } else {
                balance -= 1
                if prev == "(" {
                    result += 1 << balance
                }
            }
            prev = c
        }
        return result
    }
    
    func tests() {
        print(scoreOfParentheses("()")) // 1
        print(scoreOfParentheses("(())")) // 2
        print(scoreOfParentheses("()()")) // 2
    }
}
