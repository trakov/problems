final class CountLargestGroup {
    func countLargestGroup(_ n: Int) -> Int {
        var map: [Int: Int] = [:]
        var maxCount = 0
        for num in 1...n {
            var num = num
            var sum = 0
            while num > 0 {
                sum += num % 10
                num /= 10
            }
            map[sum, default: 0] += 1
            maxCount = max(maxCount, map[sum]!)
        }
        var result = 0
        for count in map.values where count == maxCount {
            result += 1
        }
        return result
    }
    
    func tests() {
        print(countLargestGroup(13)) // 4
        print(countLargestGroup(2)) // 2
    }
}
