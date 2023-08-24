class TextJustification {
    func lastLine(of words: [String], _ maxWidth: Int) -> String {
        var line = words.joined(separator: " ")
        if line.count < maxWidth {
            line.append(String(repeating: " ", count: maxWidth - line.count))
        }
        return line
    }
    
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        guard words.count > 1 else {
            return [lastLine(of: words, maxWidth)]
        }
        var result: [String] = []
        var line: [String] = []
        var lineWidth = 0
        for word in words {
            guard !line.isEmpty else {
                line = [word]
                lineWidth = word.count
                continue
            }
            let width = lineWidth + line.count - 1
            guard width + word.count + 1 > maxWidth else {
                line.append(word)
                lineWidth += word.count
                continue
            }
            if line.count == 1 {
                result.append(lastLine(of: line, maxWidth))
            } else {
                var space = maxWidth - lineWidth
                var gap = space / (line.count - 1)
                if space % (line.count - 1) != 0 {
                    gap += 1
                }
                var string = line.first!
                for i in 1..<line.count {
                    string.append(String(repeating: " ", count: gap))
                    string.append(line[i])
                    space -= gap
                    if (line.count - i - 1) != 0 && space % (line.count - i - 1) == 0 {
                        gap = space / (line.count - i - 1)
                    }
                }
                result.append(string)
            }
            line = [word]
            lineWidth = word.count
        }
        result.append(lastLine(of: line, maxWidth))
        return result
    }
    
    func tests() {
        print(fullJustify(["This", "is", "an", "example", "of", "text", "justification."], 16))
//          [
//             "This    is    an",
//             "example  of text",
//             "justification.  "
//          ]
        print(fullJustify(["What","must","be","acknowledgment","shall","be"], 16))
//          [
//            "What   must   be",
//            "acknowledgment  ",
//            "shall be        "
//          ]
        print(fullJustify(["Science","is","what","we","understand","well","enough","to","explain","to","a","computer.","Art","is","everything","else","we","do"], 20))
//          [
//            "Science  is  what we",
//            "understand      well",
//            "enough to explain to",
//            "a  computer.  Art is",
//            "everything  else  we",
//            "do                  "
//          ]
    }
}

