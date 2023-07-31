class Subsets {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var temp: [Int] = []
        func backtrack(idx: Int) {
            if temp.count <= nums.count {
                result.append(temp)
            } else {
                return
            }
            for i in idx..<nums.count {
                guard !temp.contains(nums[i]) else { continue }
                temp.append(nums[i])
                backtrack(idx: i + 1)
                temp.removeLast()
            }
        }
        backtrack(idx: 0)
        return result
    }
    
    func tests() {
        print(subsets([1,2,3])) // [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
        print(subsets([0])) // [[],[0]]
    }
}
