class AssignCookies {
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        guard !g.isEmpty && !s.isEmpty else { return 0 }
        let g = g.sorted()
        let s = s.sorted()
        var i = 0
        var j = 0
        var count = 0
        while i < g.count, j < s.count {
            if g[i] <= s[j] {
                i += 1
                j += 1
                count += 1
            } else {
                j += 1
            }
        }
        
        return count
    }

    func tests() {
        print(findContentChildren([1,2,3], [1,1])) // 1
        print(findContentChildren([1,2], [1,2,3])) // 2

    }
}
