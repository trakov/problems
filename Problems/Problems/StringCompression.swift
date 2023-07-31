class StringCompression {
    func compress(_ chars: inout [Character]) -> Int {
        guard chars.count > 1 else { return chars.count }
        var prev = chars[0]
        var count = 1
        var i = 1
        var resultIndex = 1
        while i < chars.count {
            let char = chars[i]
            if char == prev {
                count += 1
            } else {
                prev = char
                if count > 1 {
                    var num: [Character] = []
                    while count > 0 {
                        num.append(Character(String(count % 10)))
                        count /= 10
                    }
                    for c in num.reversed() {
                        chars[resultIndex] = c
                        resultIndex += 1
                    }
                }
                chars[resultIndex] = char
                count = 1
                resultIndex += 1
            }
            i += 1
        }
        if count > 1 {
            var num: [Character] = []
            while count > 0 {
                num.append(Character(String(count % 10)))
                count /= 10
            }
            for c in num.reversed() {
                chars[resultIndex] = c
                resultIndex += 1
            }
        }
        chars.removeLast(i - resultIndex)
        return chars.count
    }

    func tests() {
        var chars: [Character] = ["a","a","b","b","c","c","c"]
        
        print(compress(&chars)) // 6
        print(chars) // ["a","2","b","2","c","3"]
        
        chars = ["a"]
        print(compress(&chars)) // 1
        print(chars) // [""a]

        chars = ["a","b","b","b","b","b","b","b","b","b","b","b","b"]
        print(compress(&chars)) // 4
        print(chars) // ["a","b","1","2"]

        
    }
}
