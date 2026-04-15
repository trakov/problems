final class ShortestDistancetoTargetStringinaCircularArray {
    func closestTarget(_ words: [String], _ target: String, _ startIndex: Int) -> Int {
        var result = Int.max
        for (i, w) in words.enumerated() where w == target {
            result = min(
                result,
                abs(i - startIndex),
                words.count - abs(i - startIndex)
            )
        }
        return result == Int.max ? -1 : result
    }
    
    func tests() {
        print(closestTarget(["hello","i","am","leetcode","hello"], "hello", 1)) // 1
        print(closestTarget(["a","b","leetcode"], "leetcode", 0)) // 1
        print(closestTarget(["i","eat","leetcode"], "ate", 0)) // -1
    }
}
