class PermutationsII {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        var temp: [Int] = []
        var counter: [Int: Int] = [:]
        for num in nums {
            counter[num, default: 0] += 1
        }
        func backtrack() {
            if temp.count == nums.count {
                result.append(temp)
                return
            }
            for (key, count) in counter {
                guard count > 0 else { continue }
                temp.append(key)
                counter[key]! -= 1
                backtrack()
                temp.removeLast()
                counter[key]! += 1
            }
        }
        backtrack()
        return result
    }

    func permuteUnique2(_ nums: [Int]) -> [[Int]] {
        var result: Set<[Int]> = []
        var temp: [Int] = []
        var indices = Set(0..<nums.count)
        
        func backtrack() {
            if temp.count == nums.count {
                result.insert(temp)
                return
            }
            for i in indices {
                temp.append(nums[i])
                indices.remove(i)
                backtrack()
                temp.removeLast()
                indices.insert(i)
            }
        }
        
        backtrack()
        
        return Array(result)
    }

    func tests() {
        print(permuteUnique([1,1,2])) // [[1,1,2],[1,2,1],[2,1,1]]
        print(permuteUnique([1,2,3])) // [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
    }
}
