class CombinationSumII {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let candidates = candidates.sorted()
        var result: [[Int]] = []
        var temp: [Int] = []

        func backtrack(idx: Int, t: Int) {
            guard t > 0 else {
                result.append(temp)
                return
            }
            for i in idx..<candidates.count {
                guard candidates[i] <= t else { break }
                guard i == idx || candidates[i] != candidates[i-1] else { continue }
                temp.append(candidates[i])
                backtrack(idx: i + 1, t: t - candidates[i])
                temp.removeLast()
            }
        }
        backtrack(idx: 0, t: target)
        return result
    }

    func tests() {
        print(combinationSum2([1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1], 30))
        print(combinationSum2([10,1,2,7,6,1,5], 8)) // [[1,1,6],[1,2,5],[1,7],[2,6]]
        print(combinationSum2([2,5,2,1,2], 5)) // [[1,2,2],[5]]
    }
}
