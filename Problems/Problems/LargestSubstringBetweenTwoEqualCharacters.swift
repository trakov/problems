class LargestSubstringBetweenTwoEqualCharacters {
    func maxLengthBetweenEqualCharacters(_ s: String) -> Int {
        var map: [Character: Int] = [:]
        var result = -1
        for (i, c) in s.enumerated() {
            if let first = map[c] {
                result = max(result, i - first - 1)
            } else {
                map[c] = i
            }
        }
        return result
    }
    
    func tests() {
        print(maxLengthBetweenEqualCharacters("aa")) // 0
        print(maxLengthBetweenEqualCharacters("abca")) // 2
        print(maxLengthBetweenEqualCharacters("cbzxy")) // -1
        print(maxLengthBetweenEqualCharacters("mgntdygtxrvxjnwksqhxuxtrv")) // 18
    }
}

