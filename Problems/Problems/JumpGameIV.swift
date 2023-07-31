class JumpGameIV {
    func minJumps(_ arr: [Int]) -> Int {
        let n = arr.count
        guard n > 2 else { return n - 1 }
        guard arr[0] != arr.last! else { return 1 }
        var numMap: [Int: [Int]] = [:] // num: indexes
        for (i, num) in arr.enumerated() {
            numMap[num, default: []].append(i)
        }
        var result = 0
        var queue: [Int] = [0]
        var visited: Set<Int> = [0]
        while !queue.isEmpty {
            var newQueue: [Int] = []
            for i in queue {
                if i == n-1 {
                    return result
                }
                for child in numMap[arr[i]] ?? [] {
                    guard !visited.contains(child) else { continue }
                    visited.insert(child)
                    newQueue.append(child)
                }
                numMap[arr[i]] = nil
                if i + 1 < n && !visited.contains(i + 1) {
                    visited.insert(i + 1)
                    newQueue.append(i + 1)
                }
                if i - 1 >= 0 && !visited.contains(i - 1) {
                    visited.insert(i - 1)
                    newQueue.append(i - 1)
                }
            }
            queue = newQueue
            result += 1
        }
        return result
    }

    func tests() {
        print(minJumps([7,7,2,1,7,7,7,3,4,1])) // 3
        print(minJumps([100,-23,-23,404,100,23,23,23,3,404])) // 3
        print(minJumps([7])) // 0
        print(minJumps([7,6,9,6,9,6,9,7])) // 1
    }
}
