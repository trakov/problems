final class MinimumOperationstoMakeArrayElementsZero {
    func minOperations(_ queries: [[Int]]) -> Int {
        func get(_ num: Int) -> Int {
            var cnt = 0
            var i = 1
            var base = 1
            while (base <= num) {
                let end = min(base * 2 - 1, num)
                cnt += ((i + 1) / 2) * (end - base + 1)
                i += 1
                base *= 2
            }
            return cnt
        }
        var result = 0
        for q in queries {
            let count1 = get(q[1])
            let count2 = get(q[0] - 1)
            result += (count1 - count2 + 1) / 2
        }
        return result
    }

    func tests() {
        print(minOperations([[1,2],[2,4]])) // 3
        print(minOperations([[2,6]])) // 4
    }
}
