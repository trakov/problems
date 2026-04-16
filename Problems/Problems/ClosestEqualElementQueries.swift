final class ClosestEqualElementQueries {
    func solveQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
        let n = nums.count
        var map: [Int: [Int]] = [:]
        for (i, num) in nums.enumerated() {
            map[num, default: []].append(i)
        }
        for num in map.keys {
            let indices = map[num]!
            if indices.count == 1 {
                map[num] = nil
            } else {
                let prev = indices.last! - n
                let next = indices.first! + n
                map[num] = [prev] + indices + [next]
            }
        }
        var result = Array(repeating: -1, count: queries.count)
        for (i, index) in queries.enumerated() {
            let num = nums[index]
            guard let indices = map[num] else { continue }
            var (left, right) = (0, indices.count - 1)
            while left < right {
                let mid = (left + right) / 2
                if indices[mid] < index {
                    left = mid + 1
                } else if indices[mid] > index {
                    right = mid - 1
                } else {
                    left = mid
                    break
                }
            }
            result[i] = min(indices[left + 1] - index, index - indices[left - 1])
        }
        return result
    }
    
    func tests() {
        print(solveQueries([1,3,1,4,1,3,2], [0,3,5])) // [2,-1,3]
        print(solveQueries([1,2,3,4], [0,1,2,3])) // [-1,-1,-1,-1]
    }
}
