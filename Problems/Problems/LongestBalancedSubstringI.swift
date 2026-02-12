final class LongestBalancedSubstringI {
    func longestBalanced(_ s: String) -> Int {
        let n = s.count
        guard n > 2 else { return n }
        
        func check(_ map: [Character: Int]) -> Bool {
            guard map.count > 1 else { return true }
            let count = map.first!.value
            return map.allSatisfy { $1 == count }
        }
        
        var result = 2
        for (i, a) in s.enumerated().dropLast() {
            var map: [Character: Int] = [a: 1]
            for (j, b) in s.enumerated().dropFirst(i + 1) {
                map[b, default: 0] += 1
                if check(map) {
                    result = max(result, j - i + 1)
                }
            }
        }
        return result
    }
    
    func tests() {
        print(longestBalanced("abbac")) // 4
        print(longestBalanced("zzabccy")) // 4
        print(longestBalanced("aba")) // 2
    }
}
