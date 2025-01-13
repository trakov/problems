class MinimumLengthofStringAfterOperations {
    func minimumLength(_ s: String) -> Int {
        var map: [Character: Int] = [:]
        for c in s {
            map[c, default: 0] += 1
        }
        var result = 0
        for count in map.values {
            result += (count % 2 == 0) ? 2 : 1
        }
        return result
    }
    
    func tests() {
        print(minimumLength("abaacbcbb")) // 5
        print(minimumLength("aa")) // 2
    }
}

