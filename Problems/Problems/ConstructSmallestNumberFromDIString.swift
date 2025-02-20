class ConstructSmallestNumberFromDIString {
    func smallestNumber(_ pattern: String) -> String {
        let n = pattern.count
        var result: [Int] = []
        var stack: [Int] = []
        for (i, c) in (pattern + "I").enumerated() {
            stack.append(i + 1)
            if i == n || c == "I" {
                while !stack.isEmpty {
                    result.append(stack.removeLast())
                }
            }
        }
        return String(result.map { Character(String($0)) })
    }
    
    func tests() {
        print(smallestNumber("IIIDIDDD")) // "123549876"
        print(smallestNumber("DDD")) // "4321"
    }
}

