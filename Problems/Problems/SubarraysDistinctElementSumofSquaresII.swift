final class SubarraysDistinctElementSumofSquaresII {
    class BIT {
        var size: Int
        var _tree1: [Int]
        var _tree2: [Int]
        init(_ n: Int) {
            self.size = n
            self._tree1 = [Int](repeating: 0, count: n + 2)
            self._tree2 = [Int](repeating: 0, count: n + 2)
        }
        private func _lowbit(_ index: Int) -> Int {
            return index & -index
        }
        func add(_ left: Int, _ right: Int, _ delta: Int) {
            _add(left, delta)
            _add(right + 1, -delta)
        }
        func query(_ left: Int, _ right: Int) -> Int {
            return _query(right) - _query(left - 1)
        }
        private func _add(_ index: Int, _ delta: Int) {
            var index = index + 1
            let rawIndex = index
            while index <= size {
                _tree1[index] += delta
                _tree2[index] += rawIndex * delta
                index += _lowbit(index)
            }
        }
        private func _query(_ index: Int) -> Int {
            var index = index + 1
            let rawIndex = index + 1
            if index > size {
                index = size
            }
            var res = 0
            while index > 0 {
                res += rawIndex * _tree1[index] - _tree2[index]
                index -= _lowbit(index)
            }
            return res
        }
    }

    func sumCounts(_ nums: [Int]) -> Int {
        let mod = 1_000_000_007
        var result = 0
        var cur = 0
        let bit = BIT(nums.count + 10)
        var seen: [Int: Int] = [:]
        for (i, num) in nums.enumerated() {
            let j = (seen[num] ?? -1) + 1
            let q = bit.query(j, i)
            cur = (cur + q * 2 + i - j + 1) % mod
            result = (result + cur) % mod
            bit.add(j, i, 1)
            seen[num] = i
        }
        return result
    }
    
    func tests() {
        print(sumCounts([1,2,1])) // 15
        print(sumCounts([2,2])) // 3
    }
}
