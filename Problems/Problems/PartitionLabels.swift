class PartitionLabels {
    func partitionLabels(_ s: String) -> [Int] {
        var map: [Character: Int] = [:]
        for (i, c) in s.enumerated() {
            map[c] = i
        }
        var j = 0
        var anchor = 0
        var result: [Int] = []
        for (i, c) in s.enumerated() {
            j = max(j, map[c] ?? -1)
            if i == j {
                result.append(i - anchor + 1)
                anchor = i + 1
            }
        }
        return result
    }
    
    func tests() {
        print(partitionLabels("ababcbacadefegdehijhklij")) // [9,7,8]
        print(partitionLabels("eccbbbbdec")) // [10]
    }
}

