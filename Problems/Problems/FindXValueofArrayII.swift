final class FindXValueofArrayII {
    class SegmentTree {
        private let maxK = 6
        private let k: Int
        private let n: Int
        private var tree: [[Int]]
        init(_ nums: [Int], _ k: Int) {
            self.k = k
            self.n = nums.count
            let size = 2 << String(n, radix: 2).count
            self.tree = Array(repeating: Array(repeating: 0, count: maxK), count: size)
            build(nums, 1, 0, n - 1)
        }
        private func makeLeaf(_ o: Int, _ value: Int) {
            tree[o] = Array(repeating: 0, count: maxK)
            let r = value % k
            tree[o][r] = 1
            tree[o][k] = r
        }
        private func mergePre(_ left: [Int], _ right: [Int], _ result: inout [Int]) {
            let mulL = left[k]
            let mulR = right[k]
            result[k] = (mulL * mulR) % k
            
            for x in 0..<k {
                result[x] = left[x]
            }
            for x in 0..<k {
                result[(mulL * x) % k] += right[x]
            }
        }
        private func maintain(_ o: Int) {
            mergePre(tree[o * 2], tree[o * 2 + 1], &tree[o])
        }
        private func build(_ nums: [Int], _ o: Int, _ l: Int, _ r: Int) {
            if l == r {
                makeLeaf(o, nums[l])
                return
            }
            let m = (l + r) / 2
            build(nums, o * 2, l, m)
            build(nums, o * 2 + 1, m + 1, r)
            maintain(o)
        }
        func update(_ o: Int, _ l: Int, _ r: Int, _ index: Int, _ value: Int) {
            if l == r {
                makeLeaf(o, value)
                return
            }
            let m = (l + r) / 2
            if index <= m {
                update(o * 2, l, m, index, value)
            } else {
                update(o * 2 + 1, m + 1, r, index, value)
            }
            maintain(o)
        }
        func query(_ o: Int, _ l: Int, _ r: Int, _ L: Int, _ R: Int) -> [Int] {
            if L <= l && r <= R {
                return tree[o]
            }
            let m = (l + r) / 2
            if R <= m {
                return query(o * 2, l, m, L, R)
            }
            if L > m {
                return query(o * 2 + 1, m + 1, r, L, R)
            }
            let left = query(o * 2, l, m, L, R)
            let right = query(o * 2 + 1, m + 1, r, L, R)
            var result = Array(repeating: 0, count: maxK)
            mergePre(left, right, &result)
            return result
        }
    }

    func resultArray(_ nums: [Int], _ k: Int, _ queries: [[Int]]) -> [Int] {
        let n = nums.count
        let seg = SegmentTree(nums, k)
        var result = Array(repeating: 0, count: queries.count)
        for (i, q) in queries.enumerated() {
            let index = q[0]
            let value = q[1]
            let start = q[2]
            let x = q[3]
            seg.update(1, 0, n - 1, index, value)
            let pre = seg.query(1, 0, n - 1, start, n - 1)
            result[i] = pre[x]
        }
        return result
    }
    
    func tests() {
        print(resultArray([1,2,3,4,5], 3, [[2,2,0,2],[3,3,3,0],[0,1,0,1]])) // [2,2,2]
        print(resultArray([1,2,4,8,16,32], 4, [[0,2,0,2],[0,2,0,1]])) // [1,0]
        print(resultArray([1,1,2,1,1], 2, [[2,1,0,1]])) // [5]
    }
}
