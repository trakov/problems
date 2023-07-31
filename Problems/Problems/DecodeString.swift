class DecodeString {
    func decodeString(_ s: String) -> String {
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
