class DecodeString {
    // recursive
    func decodeString(_ s: String) -> String {
        var index = 0
        func decode(_ s: [Character]) -> String {
            var result = ""
            while index < s.count && s[index] != "]" {
                if !s[index].isNumber {
                    result.append(s[index])
                    index += 1
                } else {
                    var num = 0
                    while index < s.count, let n = s[index].wholeNumberValue {
                        num = num * 10 + n
                        index += 1
                    }
                    index += 1 // [
                    let str = decode(s)
                    index += 1 // ]
                    while num > 0 {
                        result.append(str)
                        num -= 1
                    }
                }
            }
            return result
        }
        return decode(Array(s))
    }
    
    // 2 stacks
    func decodeString1(_ s: String) -> String {
        var count: [Int] = []
        var stack: [String] = []
        var result = ""
        var num = 0
        for c in s {
            if let n = c.wholeNumberValue {
                num = num * 10 + n
            } else if c == "[" {
                count.append(num)
                stack.append(result)
                result = ""
                num = 0
            } else if c == "]" {
                let str = stack.removeLast()
                let strCount = max(count.removeLast(), 1)
                result = str + String(repeating: result, count: strCount)
            } else {
                result.append(c)
            }
        }
        return result
    }
    
    func decodeString2(_ s: String) -> String {
        var result = ""
        var stack: [String] = []
        for ch in s {
            if stack.isEmpty && !("0"..."9").contains(ch) {
                result.append(ch)
            } else {
                if ch != "]" {
                    stack.append("\(ch)")
                    continue
                }
                var tempResult = ""
                while let last = stack.last {
                    if last != "[" {
                        tempResult = "\(last)" + tempResult
                        stack.removeLast()
                    } else if last == "[" {
                        stack.removeLast()
                        break
                    }
                }
                var numStr = ""
                while let last = stack.last {
                    if ("0"..."9").contains(last) {
                        numStr = "\(last)" + numStr
                        stack.removeLast()
                    } else {
                        tempResult = String(repeating: tempResult, count: Int(numStr) ?? 1)
                        break
                    }
                }
                if stack.isEmpty {
                    tempResult = String(repeating: tempResult,
                                        count: Int(numStr) ?? 1)
                    result += tempResult
                } else {
                    stack.append(tempResult)
                }
            }
        }
        return result
    }

    func tests() {
        print(decodeString("3[z]2[2[y]pq4[2[jk]e1[f]]]ef")) //
//        zzzyypqjkjkefjkjkefjkjkefjkjkefyypqjkjkefjkjkefjkjkefjkjkefef
        print(decodeString("3[a]2[bc]")) // "aaabcbc"
        print(decodeString("3[a2[c]]")) // "accaccacc"
        print(decodeString("2[abc]3[cd]ef")) // "abcabccdcdcdef"
        print(decodeString("abc3[cd]xyz")) // "abccdcdcdxyz"
    }
}
