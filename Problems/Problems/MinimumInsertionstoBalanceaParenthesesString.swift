final class MinimumInsertionstoBalanceaParenthesesString {
    func minInsertions(_ s: String) -> Int {
        let chars = Array(s)
        var insertions = 0
        var leftCount = 0
        var index = 0
        let n = chars.count
        while index < n {
            let c = chars[index]
            if c == "(" {
                leftCount += 1
                index += 1
            } else {
                if leftCount > 0 {
                    leftCount -= 1
                } else {
                    insertions += 1
                }
                if index < n - 1 && chars[index + 1] == ")" {
                    index += 2
                } else {
                    insertions += 1
                    index += 1
                }
            }
        }
        return insertions + leftCount * 2
    }
    
    func tests() {
        print(minInsertions("(()))")) // 1
        print(minInsertions("())")) // 0
        print(minInsertions("))())(")) // 3
    }
}
