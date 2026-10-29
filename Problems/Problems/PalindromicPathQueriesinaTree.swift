final class PalindromicPathQueriesinaTree {
    class BIT {
        private var tree: [Int]
        private var n: Int
        init(_ _n: Int) {
            n = _n
            tree = [Int](repeating: 0, count: _n + 1)
        }
        private func lowbit(_ x: Int) -> Int {
            return x & -x
        }
        func update(_ x: Int, _ v: Int) {
            var x = x
            while x <= n {
                tree[x] ^= v
                x += lowbit(x)
            }
        }
        func query(_ x: Int) -> Int {
            var x = x
            var ret = 0
            while x > 0 {
                ret ^= tree[x]
                x -= lowbit(x)
            }
            return ret
        }
        func updateRange(_ l: Int, _ r: Int, _ v: Int) {
            update(l, v)
            update(r + 1, v)
        }
    }
    private var g: [[Int]] = []
    private var fa: [[Int]] = []
    private var dep: [Int] = []
    private var l: [Int] = []
    private var r: [Int] = []
    private var timer = 0
    private var LOG = 0
    func palindromePath(_ n: Int, _ edges: [[Int]], _ s: String, _ queries: [String]) -> [Bool] {
        g = Array(repeating: [], count: n)
        for e in edges {
            g[e[0]].append(e[1])
            g[e[1]].append(e[0])
        }
        LOG = Int.bitWidth - n.leadingZeroBitCount
        fa = Array(repeating: Array(repeating: 0, count: LOG), count: n)
        dep = Array(repeating: 0, count: n)
        l = Array(repeating: 0, count: n)
        r = Array(repeating: 0, count: n)
        timer = 0
        dfs(0, 0)
        if LOG > 1 {
            for j in 1..<LOG {
                for i in 0..<n {
                    fa[i][j] = fa[fa[i][j - 1]][j - 1]
                }
            }
        }
        let bit = BIT(n + 1)
        var chars = Array(s.utf8)
        for i in 0..<n {
            bit.updateRange(l[i], r[i], 1 << (Int(chars[i]) - Int(Character("a").asciiValue!)))
        }
        var ans: [Bool] = []
        for q in queries {
            let parts = q.split(separator: " ")
            if parts[0] == "update" {
                let u = Int(parts[1])!
                let c = Int(parts[2].utf8.first!)
                bit.updateRange(
                    l[u],
                    r[u],
                    (1 << (Int(chars[u]) - 97)) ^ (1 << (c - 97))
                )
                chars[u] = UInt8(c)
            } else {
                let u = Int(parts[1])!
                let v = Int(parts[2])!
                let w = lca(u, v)
                let mask = bit.query(l[u]) ^ bit.query(l[v]) ^ (1 << (Int(chars[w]) - 97))
                ans.append(mask.nonzeroBitCount <= 1)
            }
        }
        return ans
    }
    private func dfs(_ u: Int, _ p: Int) {
        timer += 1
        l[u] = timer
        fa[u][0] = p
        for v in g[u] {
            if v == p {
                continue
            }
            dep[v] = dep[u] + 1
            dfs(v, u)
        }
        r[u] = timer
    }
    private func lca(_ u: Int, _ v: Int) -> Int {
        var u = u
        var v = v
        if dep[u] < dep[v] {
            swap(&u, &v)
        }
        let diff = dep[u] - dep[v]
        for i in 0..<LOG {
            if ((diff >> i) & 1) == 1 {
                u = fa[u][i]
            }
        }
        if u == v {
            return u
        }
        for i in stride(from: LOG - 1, through: 0, by: -1) {
            if fa[u][i] != fa[v][i] {
                u = fa[u][i]
                v = fa[v][i]
            }
        }
        return fa[u][0]
    }

    func tests() {
        print(palindromePath(
            3, [[0,1],[1,2]], "aac", ["query 0 2","update 1 b","query 0 2"])
        ) // [true, false]
        print(palindromePath(
            4, [[0,1],[0,2],[0,3]], "abca", ["query 1 2","update 0 b","query 2 3","update 3 a","query 1 3"])
        ) // [false,false,true]
    }
}
