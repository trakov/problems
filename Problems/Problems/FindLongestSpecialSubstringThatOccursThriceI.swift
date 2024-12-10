class FindLongestSpecialSubstringThatOccursThriceI {
    
    func maximumLength(_ s: String) -> Int {
        var freq: [UInt8: [Int: Int]] = [:]
        var curr: UInt8 = 0
        var length = 0
        var result = -1
        for c in s.utf8 {
            if c != curr { length = 0 }
            length += 1
            curr = c
            for i in max(1, length - 2)..<length+1 {
                freq[c, default: [:]][i, default: 0] += 1
                if freq[c]![i]! >= 3 { result = max(result, i)}
            }
        }
        return result
    }

    // TODO:
    func maximumLength2(_ s: String) -> Int {
        guard s.count > 2 else { return -1 }
        var map: [Character: [Int: Int]] = [:] // char: [length: count]
        var prev = s.first!
        var count = 1
        for c in (s + "*").dropFirst() {
            if c == prev {
                count += 1
            } else {
                map[prev, default: [:]][count, default: 0] += 1
                count = 1
                prev = c
            }
        }
        var result = -1
        for val in map.values {
            let val = val.sorted { $0.key > $1.key }
            let maxLength = val.first!.key
            for (length, count) in val where result < length {
                guard count < 3 else {
                    result = length
                    break
                }
                guard length != maxLength else { continue }
                if result < count - 2 {
                    result = count - 2
                    break
                }
            }
        }
        return result
    }
    
    func tests() {
        print(maximumLength("aaaa")) // 2
        print(maximumLength("abcdef")) // -1
        print(maximumLength("abcaba")) // 1
    }
}

