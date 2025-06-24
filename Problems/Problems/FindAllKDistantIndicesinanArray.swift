final class FindAllKDistantIndicesinanArray {
    func findKDistantIndices(_ nums: [Int], _ key: Int, _ k: Int) -> [Int] {
        var result: [Int] = []
        for (i, num) in nums.enumerated() where num == key {
            let index: Int
            if let last = result.last {
                index = max(last + 1, i - k)
            } else {
                index = max(0, i - k)
            }
            for j in index...min(i+k, nums.count - 1) {
                result.append(j)
            }
            if result.last! == nums.count - 1 { break }
        }
        return result
    }
    
    func tests() {
        print(findKDistantIndices([3,4,9,1,3,9,5], 9, 1)) // [1,2,3,4,5,6]
        print(findKDistantIndices([2,2,2,2,2], 2, 2)) // [0,1,2,3,4]
    }
}
