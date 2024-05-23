class TheNumberofBeautifulSubsets {
    func beautifulSubsets(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        guard n > 1 else { return 1 }
        var result = 0
        func dfs(_ idx: Int, _ set: Set<Int>) {
            guard idx < n else { return }
            let num = nums[idx]
            if !set.contains(num + k) && !set.contains(num - k) {
                result += 1
                dfs(idx + 1, set.union([num]))
            }
            dfs(idx + 1, set)
        }
        dfs(0, [])
        return result
    }
    
    func tests() {
        print(beautifulSubsets([2,4,6], 2)) // 4
        print(beautifulSubsets([2,2,2], 2)) // 7
        print(beautifulSubsets([2,4,7], 2)) // 5
        print(beautifulSubsets([1], 1)) // 1
    }
}

