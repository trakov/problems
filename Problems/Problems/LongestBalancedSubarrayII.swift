final class LongestBalancedSubarrayII {
    final class SegmentTree {
        private let n: Int
        private var minTree: [Int]
        private var maxTree: [Int]
        private var lazy: [Int]

        init(_ n: Int) {
            self.n = n
            self.minTree = Array(repeating: 0, count: 4 * n)
            self.maxTree = Array(repeating: 0, count: 4 * n)
            self.lazy = Array(repeating: 0, count: 4 * n)
        }

        private func push(_ node: Int, _ start: Int, _ end: Int) {
            let lz = lazy[node]
            if lz != 0 {
                minTree[node] += lz
                maxTree[node] += lz
                if start != end {
                    lazy[node * 2] += lz
                    lazy[node * 2 + 1] += lz
                }
                lazy[node] = 0
            }
        }

        func updateRange(_ node: Int, _ start: Int, _ end: Int, _ l: Int, _ r: Int, _ val: Int) {
            push(node, start, end)
            if start > end || start > r || end < l { return }

            if l <= start && end <= r {
                lazy[node] += val
                push(node, start, end)
                return
            }

            let mid = (start + end) >> 1
            updateRange(node * 2, start, mid, l, r, val)
            updateRange(node * 2 + 1, mid + 1, end, l, r, val)

            minTree[node] = min(minTree[node * 2], minTree[node * 2 + 1])
            maxTree[node] = max(maxTree[node * 2], maxTree[node * 2 + 1])
        }

        func findLeftmostZero(_ node: Int, _ start: Int, _ end: Int) -> Int {
            push(node, start, end)
            if minTree[node] > 0 || maxTree[node] < 0 { return -1 }
            if start == end {
                return minTree[node] == 0 ? start : -1
            }

            let mid = (start + end) >> 1
            let left = findLeftmostZero(node * 2, start, mid)
            if left != -1 { return left }
            return findLeftmostZero(node * 2 + 1, mid + 1, end)
        }
    }

    func longestBalanced(_ nums: [Int]) -> Int {
        let n = nums.count
        var lastPos = [Int: Int]()
        let st = SegmentTree(n)
        var res = 0
        for r in 0..<n {
            let v = nums[r]
            let val = (v & 1 == 0) ? 1 : -1

            if let p = lastPos[v] {
                st.updateRange(1, 0, n - 1, 0, p, -val)
            }

            st.updateRange(1, 0, n - 1, 0, r, val)
            lastPos[v] = r

            let l = st.findLeftmostZero(1, 0, n - 1)
            if l != -1 && l <= r {
                res = max(res, r - l + 1)
            }
        }
        return res
    }
    
    func tests() {
        print(longestBalanced([2,5,4,3])) // 4
        print(longestBalanced([3,2,2,5,4])) // 5
        print(longestBalanced([1,2,3,2])) // 3
    }
}
