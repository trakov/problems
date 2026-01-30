extension Character {
    var index: Int {
        Int(asciiValue! - Character("a").asciiValue!)
    }
}

final class MinimumCosttoConvertStringII {
    class Trie {
        var child: [Trie?] = Array(repeating: nil, count: 26)
        var id = -1
    }
    
    let INF = Int.max / 2

    func add(_ node: Trie, _ word: String, _ index: inout [Int]) -> Int {
        var node: Trie? = node
        for ch in word {
            let i = ch.index
            if node!.child[i] == nil {
                node!.child[i] = Trie()
            }
            node = node!.child[i];
        }
        if node!.id == -1 {
//            node!.id = ++index[0];
            index[0] += 1
            node!.id = index[0]
        }
        return node!.id
    }

    func update(_ x: inout [Int], _ y: Int) {
        if x[0] == -1 || y < x[0] {
            x[0] = y
        }
    }

    func minimumCost(_ source: String, _ target: String, _ original: [String], _ changed: [String], _ cost: [Int]) -> Int {
        let n = source.count
        let m = original.count
        let root = Trie()
        var p = [-1]
        var G = Array(repeating: Array(repeating: INF, count: m * 2), count: m * 2)
        for i in 0..<m*2 {
            G[i][i] = 0
        }
        for i in 0..<m {
            let x = add(root, original[i], &p)
            let y = add(root, changed[i], &p)
            G[x][y] = min(G[x][y], cost[i])
        }
        let size = p[0] + 1
        for k in 0..<size {
            for i in 0..<size {
                for j in 0..<size {
                    G[i][j] = min(G[i][j], G[i][k] + G[k][j])
                }
            }
        }
        var f = Array(repeating: -1, count: n)
        let (source, target) = (Array(source), Array(target))
        for j in 0..<n {
            if j > 0 && f[j - 1] == -1 {
                continue
            }
            let base = j == 0 ? 0 : f[j - 1]
            if source[j] == target[j] {
                f[j] = f[j] == -1 ? base : min(f[j], base)
            }
            var u: Trie? = root
            var v: Trie? = root
            for i in j..<n {
                u = u?.child[source[i].index]
                v = v?.child[target[i].index]
                guard let u, let v else { break }
                if u.id != -1, v.id != -1, G[u.id][v.id] != INF {
                    let newVal = base + G[u.id][v.id]
                    if f[i] == -1 || newVal < f[i] {
                        f[i] = newVal
                    }
                }
            }
        }
        return f[n - 1]
    }
    
    func tests() {
        print(minimumCost(
            "abcd", "acbe", ["a","b","c","c","e","d"], ["b","c","b","e","b","e"], [2,5,5,1,2,20]
        )) // 28
        print(minimumCost(
            "abcdefgh", "acdeeghh", ["bcd","fgh","thh"], ["cde","thh","ghh"], [1,3,5]
        )) // 9
        print(minimumCost(
            "abcdefgh", "addddddd", ["bcd","defgh"], ["ddd","ddddd"], [100,1578]
        )) // -1
    }
}
