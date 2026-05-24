final class JumpGameV {
    func maxJumps(_ arr: [Int], _ d: Int) -> Int {
        let n = arr.count
        var f = Array(repeating: -1, count: n)
        func dfs(_ id: Int) {
            guard f[id] == -1 else { return }
            f[id] = 1
            var i = id - 1
            while i >= 0 && id - i <= d && arr[id] > arr[i] {
                dfs(i)
                f[id] = max(f[id], f[i] + 1)
                i -= 1
            }
            i = id + 1
            while i < n && i - id <= d && arr[id] > arr[i] {
                dfs(i)
                f[id] = max(f[id], f[i] + 1)
                i += 1
            }
        }
        for i in 0..<n {
            dfs(i)
        }
        return f.max()!
    }
    
    func tests() {
        print(maxJumps([6,4,14,6,8,13,9,7,10,6,12], 2)) // 4
        print(maxJumps([3,3,3,3,3], 3)) // 1
        print(maxJumps([7,6,5,4,3,2,1], 1)) // 7
    }
}
