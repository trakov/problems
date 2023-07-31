class ReverseWordsInString {
    func reverseWords(_ s: String) -> String {
        splitReversedJoined(s)
    }

    func splitReversedJoined(_ s: String) -> String {
        s.split(separator: " ").reversed().joined(separator: " ")
    }
    
    func tests() {
        print(reverseWords("the sky is blue")) // "blue is sky the"
        print(reverseWords("  hello world  ")) // "world hello"
        print(reverseWords("a good   example")) // "example good a"
    }
}
