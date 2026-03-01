final class PartitioningIntoMinimumNumberOfDeciBinaryNumbers {
    func minPartitions(_ n: String) -> Int {
        var result = 0
        for c in n {
            result = max(result, Int(c.asciiValue! - Character("0").asciiValue!))
        }
        return result
    }
    
    func tests() {
        print(minPartitions("32")) // 3
        print(minPartitions("82734")) // 8
        print(minPartitions("27346209830709182346")) // 9
    }
}
