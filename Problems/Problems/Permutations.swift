class Permutations {
    func permute(_ nums: [Int]) -> [[Int]] {
        var item: [Int] = []
        var res: [[Int]] = []
        func backtrack() {
            if item.count == nums.count {
                res.append(item)
                return
            }
            for num in nums {
                if item.contains(num) { continue }
                item.append(num)
                backtrack()
                item.removeLast()
            }
        }
        backtrack()
        return res
    }
    
    func tests() {
        print(permute([1,2,3,4]))
//        print(permute([1,2,3])) // [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
//        print(permute([0,1])) // [[0,1],[1,0]]
//        print(permute([1])) // [[1]]
    }
}
