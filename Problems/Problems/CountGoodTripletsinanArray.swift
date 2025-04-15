final class CountGoodTripletsinanArray {
    final class FenwickTree {
        private var tree: [Int]

        init(_ size: Int) {
            tree = Array(repeating: 0, count: size + 1)
        }

        func update(_ index: Int, _ delta: Int) {
            var i = index + 1
            while i < tree.count {
                tree[i] += delta
                i += i & -i
            }
        }

        func query(_ index: Int) -> Int {
            var i = index + 1
            var res = 0
            while i > 0 {
                res += tree[i]
                i -= i & -i
            }
            return res
        }
    }

    func goodTriplets(_ nums1: [Int], _ nums2: [Int]) -> Int {
        let n = nums1.count
        var pos2 = Array(repeating: 0, count: n)
        var reversedIndexMapping = Array(repeating: 0, count: n)
        for i in 0..<n {
            pos2[nums2[i]] = i
        }
        for i in 0..<n {
            reversedIndexMapping[pos2[nums1[i]]] = i
        }
        let tree = FenwickTree(n)
        var res = 0
        for value in 0..<n {
            let pos = reversedIndexMapping[value]
            let left = tree.query(pos)
            tree.update(pos, 1)
            let right = (n - 1 - pos) - (value - left)
            res += left * right
        }
        return res
    }
    
    func tests() {
        print(goodTriplets([2,0,1,3], [0,1,2,3])) // 1
        print(goodTriplets([4,0,1,3,2], [4,1,0,2,3])) // 4
    }
}
