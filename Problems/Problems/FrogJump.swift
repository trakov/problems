class FrogJump {
    func canCross(_ stones: [Int]) -> Bool {
        var memo: [String: Bool] = [:]
        func dfs(_ stones: [Int], _ curr: Int, _ range: Int) -> Bool {
            let key = "\(curr).\(range)"
            if curr == stones.count - 1 {
                memo[key] = true
                return true
            }
            if let value = memo[key] {
                return value
            }
            for i in curr+1..<stones.count {
                let gap = stones[i] - stones[curr]
                if gap >= range-1 && gap <= range+1 {
                    if dfs(stones, i, gap) {
                        return true
                    }
                }
            }
            memo[key] = false
            return false
        }
        return dfs(stones, 0, 0)
    }
    
    func tests() {
        let a = [1,2,2]
        print(canCross([0,1,3,5,6,8,12,17])) // true
        print(canCross([0,1,2,3,4,8,9,11])) // false
    }
}
