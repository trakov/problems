class SubsetsII {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var result: [[Int]] = []
        var candidate: [Int] = []
        func backtrack(idx: Int) {
            result.append(candidate)
            for i in idx..<nums.count {
                if i == idx || nums[i-1] != nums[i] {
                    candidate.append(nums[i])
                    backtrack(idx: i+1)
                    candidate.removeLast()
                }
            }
        }

        backtrack(idx: 0)

        return result
    }

    func subsetsWithDup2(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        var result: [[Int]] = []
        var temp: [Int] = []
        
        func backtrack(idx: Int) {
            guard temp.count <= nums.count && !result.contains(temp) else { return }
            result.append(temp)
            for i in idx..<nums.count {
                let num = nums[i]
                temp.append(num)
                backtrack(idx: i + 1)
                temp.removeLast()
            }
        }
        
        backtrack(idx: 0)
        
        return result
    }

    func tests() {
        print(subsetsWithDup([1,1,2,2]))
//        print(subsetsWithDup([4,4,4,1,4]))
        // [[],[1],[1,4],[1,4,4],[1,4,4,4],[1,4,4,4,4],[4],[4,4],[4,4,4],[4,4,4,4]]
//        print(subsetsWithDup([1,2,2])) // [[],[1],[1,2],[1,2,2],[2],[2,2]]
//        print(subsetsWithDup([0])) // [[],[0]]
    }
}
