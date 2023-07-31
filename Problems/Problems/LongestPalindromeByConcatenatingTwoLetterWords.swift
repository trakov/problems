class LongestPalindromeByConcatenatingTwoLetterWords {
    func longestPalindrome(_ words: [String]) -> Int {
        var map: [Character: [Character]] = [:]
        var count = 0
        for word in words {
            if let index = map[word.last!]?.firstIndex(of: word.first!) {
                map[word.last!]?.remove(at: index)
                count += 4
            } else {
                map[word.first!, default: []].append(word.last!)
            }
        }
        for (char, chars) in map {
            if chars.contains(char) {
                count += 2
                break
            }
        }
        return count
    }

    func tests() {
        print(longestPalindrome(["lc","cl","cl","lc"])) // 8
        print(longestPalindrome(["lc","cl","gg"])) // 6
        print(longestPalindrome(["ab","ty","yt","lc","cl","ab"])) // 8
        print(longestPalindrome(["cc","ll","xx"])) // 2
        print(longestPalindrome(["cc","ll","xx","cc"])) // 4
    }
}
