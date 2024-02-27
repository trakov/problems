class FindAllPeopleWithSecret {
    class UnionFind {
        private var root: [Int]
        private var rank: [Int]
        init(_ n: Int) {
            root = Array(0..<n)
            rank = Array(repeating: 0, count: n)
        }
        func find(_ x: Int) -> Int {
            if x == root[x] { return x }
            root[x] = find(root[x])
            return root[x]
        }
        func union(_ x: Int, _ y: Int) {
            let rx = find(x)
            let ry = find(y)
            if rank[rx] > rank[ry] {
                root[ry] = rx
            } else if rank[ry] < rank[rx] {
                root[rx] = ry
            } else {
                root[ry] = rx
                rank[rx] += 1
            }
        }
        func clear(_ xs: [Int]) {
            for x in xs {
                root[x] = x
                rank[x] = 0
//                if find(x) != 0 {
//                    root[x] = x
//                }
            }
        }
        func printRoot() {
            print(root)
        }
    }
    
    func findAllPeople(_ n: Int, _ meetings: [[Int]], _ firstPerson: Int) -> [Int] {
        let uf = UnionFind(n)
        let meetings = meetings.sorted() { $0[2] < $1[2] }
        uf.union(0, firstPerson)
        var time = 0
        var persons: [Int] = []
        for meeting in meetings {
            if time != meeting[2] {
                uf.clear(persons)
                persons.removeAll()
                time = meeting[2]
            }
            uf.union(meeting[0], meeting[1])
            persons.append(meeting[0])
            persons.append(meeting[1])
        }
//        uf.printRoot()
        var result: [Int] = []
        for i in 0..<n {
            if uf.find(i) == 0 {
                result.append(i)
            }
        }
        return result
    }

    func tests() {
        print(findAllPeople(11, [[5,1,4],[0,4,18]], 1)) // [0,1,4,5]
        print(findAllPeople(6, [[0,2,1],[1,3,1],[4,5,1]], 1)) // [0,1,2,3]
        print(findAllPeople(6, [[1,2,5],[2,3,8],[1,5,10]], 1)) // [0,1,2,3,5]
        print(findAllPeople(4, [[3,1,3],[1,2,2],[0,3,3]], 3)) // [0,1,3]
        print(findAllPeople(5, [[3,4,2],[1,2,1],[2,3,1]], 1)) // [0,1,2,3,4]
        print(findAllPeople(5, [[1,4,3],[0,4,3]], 3)) // [0,1,3,4]
    }
}

