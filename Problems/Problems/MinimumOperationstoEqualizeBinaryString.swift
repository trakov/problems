final class MinimumOperationstoEqualizeBinaryString {
    func minOperations(_ s: String, _ k: Int) -> Int {
        let n = s.count
        let zeros = s.reduce(0) { $0 + ($1 == "0" ? 1 : 0) }
        var dist = Array(repeating: -1, count: n + 1)
        var even = Array(stride(from: 0, through: n, by: 2))
        var odd  = Array(stride(from: 1, through: n, by: 2))
        func lowerBound(_ arr: [Int], _ target: Int) -> Int {
            var (l, r) = (0, arr.count)
            while l < r {
                let mid = (l + r) >> 1
                if arr[mid] < target {
                    l = mid + 1
                } else {
                    r = mid
                }
            }
            return l
        }
        var queue = [zeros]
        var head = 0
        dist[zeros] = 0
        if zeros % 2 == 0 {
            even.removeAll { $0 == zeros }
        } else {
            odd.removeAll { $0 == zeros }
        }
        while head < queue.count {
            let cur = queue[head]
            head += 1
            let c1 = max(k - n + cur, 0)
            let c2 = min(cur, k)
            let lnode = cur + k - 2 * c2
            let rnode = cur + k - 2 * c1
            if lnode > rnode { continue }
            if lnode % 2 == 0 {
                let idx = lowerBound(even, lnode)
                while idx < even.count && even[idx] <= rnode {
                    let nxt = even[idx]
                    dist[nxt] = dist[cur] + 1
                    queue.append(nxt)
                    even.remove(at: idx)
                }
            } else {
                let idx = lowerBound(odd, lnode)
                while idx < odd.count && odd[idx] <= rnode {
                    let nxt = odd[idx]
                    dist[nxt] = dist[cur] + 1
                    queue.append(nxt)
                    odd.remove(at: idx)
                }
            }
        }
        return dist[0]
    }
    
    func tests() {
        print(minOperations("110", 1)) // 1
        print(minOperations("0101", 3)) // 2
        print(minOperations("101", 2)) // -1
    }
}
