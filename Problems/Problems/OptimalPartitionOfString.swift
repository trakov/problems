class OptimalPartitionOfString {
    func partitionString(_ s: String) -> Int {
        var result = 1
        var temp: Set<Character> = []
        for c in s {
            if temp.insert(c).inserted {
                continue
            }
            result += 1
            temp = [c]
        }
        return result
    }
    
    func tests() {
        print(partitionString("abacaba")) // 4
        print(partitionString("ssssss")) // 6
    }
}

