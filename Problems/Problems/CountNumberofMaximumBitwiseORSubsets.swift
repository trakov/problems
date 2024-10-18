class CountNumberofMaximumBitwiseORSubsets {
    func countMaxOrSubsets(_ nums: [Int]) -> Int {
        let or = nums.reduce(0, |)
        func go(_ stack: [Int] = nums) -> [[Int]] {
            guard stack.count > 1 else { return [stack] }
            let ret = go(Array(stack.dropFirst()))
            return [[stack[0]]] + ret + ret.map { [stack[0]] + $0 }
        }
        return go()
            .filter { $0.reduce(0, |) == or }
            .count
    }
    
    func tests() {
        print(countMaxOrSubsets([3,1])) // 2
        print(countMaxOrSubsets([2,2,2])) // 7
        print(countMaxOrSubsets([3,2,1,5])) // 6
    }
}

