final class CounttheNumberofComputerUnlockingPermutations {
    func countPermutations(_ complexity: [Int]) -> Int {
        for c in complexity.dropFirst() where c <= complexity[0] {
            return 0
        }
        let mod = 1_000_000_007
        func fact(_ n: Int) -> Int {
            guard n > 1 else { return 1 }
            return (n * fact(n-1)) % mod
        }
        return fact(complexity.count - 1)
    }
    
    func tests() {
        print(countPermutations([1,2,3])) // 2
        print(countPermutations([3,3,3,4,4,4])) // 0
    }
}
