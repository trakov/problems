class CrawlerLogFolder {
    func minOperations(_ logs: [String]) -> UInt16 {
        var stack: UInt16 = 0
        for log in logs {
            if log == "../" {
                stack = max(stack - 1, 0)
            } else if log != "./" {
                stack += 1
            }
        }
        return stack
    }

    func tests() {
        print(minOperations(["d1/","d2/","../","d21/","./"])) // 2
        print(minOperations(["d1/","d2/","./","d3/","../","d31/"])) // 3
        print(minOperations(["d1/","../","../","../"])) // 0
    }
}
