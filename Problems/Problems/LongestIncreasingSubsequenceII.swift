class LongestIncreasingSubsequenceII {
    func lengthOfLIS(_ nums: [Int], _ k: Int) -> Int {
        let n = nums.count
        var res = 0
        var tree = Array(repeating: 0, count: 4 * 100005)

        func update(_ p: Int, _ val: Int, _ idx: Int, _ l: Int, _ r: Int) {
            if p < l || p > r {
                return
            }
            if l == r {
                tree[idx] = val
                return
            }
            let mid = (l + r) >> 1
            update(p, val, 2 * idx + 1, l, mid)
            update(p, val, 2 * idx + 2, mid + 1, r)
            tree[idx] = max(tree[2 * idx + 1], tree[2 * idx + 2])
        }

        func query(_ ql: Int, _ qr: Int, _ idx: Int, _ l: Int, _ r: Int) -> Int {
            if ql > r || qr < l {
                return Int.min
            }
            if ql <= l && qr >= r {
                return tree[idx]
            }
            let mid = (l + r) >> 1
            let lt = query(ql, qr, 2 * idx + 1, l, mid)
            let rt = query(ql, qr, 2 * idx + 2, mid + 1, r)
            return max(lt, rt)
        }

        for i in 0..<n {
            let left = max(0, nums[i] - k)
            let right = nums[i] - 1
            let q = query(left, right, 0, 0, 100000)
            res = max(res, q + 1)
            update(nums[i], q + 1, 0, 0, 100000)
        }
        return res
    }
    
    func tests() {
        print(lengthOfLIS([4,2,1,4,3,4,5,8,15], 3)) // 5
        print(lengthOfLIS([7,4,5,1,8,12,4,7], 5)) // 4
        print(lengthOfLIS([1,5], 1)) // 1
    }
}

