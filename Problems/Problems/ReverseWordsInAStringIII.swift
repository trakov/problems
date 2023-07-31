class ReverseWordsInAStringIII {
    func reverseWords(_ s: String) -> String {
        s.split(separator: " ").map { String($0.reversed()) }.joined(separator: " ")
    }
    
    func stringSolution(_ s: String) -> String {
        var result = ""
        var temp = ""
        for c in s {
            if c == " " {
                result += temp.reversed() + " "
                temp = ""
            } else {
                temp.append(c)
            }
        }
        result += temp.reversed()
        return result
    }

    func tests() {
        print(reverseWords("Let's take LeetCode contest")) // "s'teL ekat edoCteeL tsetnoc"
        print(reverseWords("God Ding")) // "doG gniD"
    }
}
