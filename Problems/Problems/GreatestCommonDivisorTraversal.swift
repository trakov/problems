class GreatestCommonDivisorTraversal {
    func canTraverseAllPairs(_ nums: [Int]) -> Bool {
        let n = nums.count
        if n == 1 {
            return true
        }
        guard !nums.contains(1) else { return false }
        let uf = FindAllPeopleWithSecret.UnionFind(n)
        var map: [Int: Int] = [:]
        for (i, num) in nums.enumerated() {
            var element = num
            var d = 2
            while d * d <= element {
                defer { d += 1 }
                if element.isMultiple(of: d) {
                    if map[d] != nil {
                        uf.union(i, map[d]!)
                    } else {
                        map[d] = i
                    }
                    while element.isMultiple(of: d) { element /= d }
                }
            }
            if element > 1 {
                if map[element] != nil {
                    uf.union(i, map[element]!)
                } else {
                    map[element] = i
                }
            }
        }
        return uf.find(0) == n
    }

    func canTraverseAllPairs2(_ nums: [Int]) -> Bool {
        let MAX = 100000
        let n = nums.count
        guard n > 1 else { return true }
        var has = Array(repeating: false, count: MAX + 1)
        for num in nums {
            has[num] = true
        }
        guard !has[1] else { return false }
        var sieve = Array(repeating: 0, count: MAX + 1)
        for d in 2...MAX {
            guard sieve[d] == 0 else { continue }
            for v in stride(from: d, through: MAX, by: d) {
                sieve[v] = d
            }
        }
        let uf = FindAllPeopleWithSecret.UnionFind(2 * MAX + 1)
        for num in nums {
            var val = num
            while val > 1 {
                let prime = sieve[val]
                let root = prime + MAX
                if uf.find(root) != uf.find(num) {
                    uf.union(root, num)
                }
                while val % prime == 0 {
                    val /= prime
                }
            }
        }
        var cnt = 0
        for i in 2...MAX {
            if has[i] && uf.find(i) == i {
                cnt += 1
            }
        }
        return cnt == 1
    }
    
    func tests() {
        print(canTraverseAllPairs([2,3,6])) // true
        print(canTraverseAllPairs([3,9,5])) // false
        print(canTraverseAllPairs([4,3,12,8])) // true
    }
}

