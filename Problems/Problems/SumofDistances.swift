final class SumofDistances {
    func distance(_ nums: [Int]) -> [Int] {
        var groups: [Int: [Int]] = [:]
        for (i, num) in nums.enumerated() {
            groups[num, default: []].append(i)
        }
        var result = nums
        for group in groups.values {
            var total = 0
            for i in group {
                total += i
            }
            var prefixTotal = 0
            for (i, idx) in group.enumerated() {
                result[idx] = total - prefixTotal * 2 + idx * (2 * i - group.count)
                prefixTotal += idx
            }
        }
        return result
    }
    
    func tests() {
        print(distance([1,3,1,1,2])) // [5,0,3,4,0]
        print(distance([0,5,3])) // [0,0,0]
    }
}
