//import HeapModule

class KthLargestSuminaBinaryTree {
//    func kthLargestLevelSum2(_ root: TreeNode?, _ k: Int) -> Int {
//        guard let root else { return -1 }
//        var sums = HeapModule.Heap<Int>()
//        var level = [root]
//        while !level.isEmpty {
//            var next: [TreeNode] = []
//            var sum = 0
//            for node in level {
//                sum += node.val
//                if let left = node.left { next.append(left) }
//                if let right = node.right { next.append(right) }
//            }
//            if sums.count < k {
//                sums.insert(sum)
//            } else if sums.min! < sum {
//                sums.removeMin()
//                sums.insert(sum)
//            }
//            level = next
//        }
//        return sums.count == k ? sums.min! : -1
//    }

    func kthLargestLevelSum(_ root: TreeNode?, _ k: Int) -> Int {
        guard let root else { return -1 }
        var sums = Heap<Int>(sort: <)
        var level = [root]
        while !level.isEmpty {
            var next: [TreeNode] = []
            var sum = 0
            for node in level {
                sum += node.val
                if let left = node.left { next.append(left) }
                if let right = node.right { next.append(right) }
            }
            if sums.count < k {
                sums.insert(sum)
            } else if sums.peek()! < sum {
                sums.remove()
                sums.insert(sum)
            }
            level = next
        }
        return sums.count == k ? sums.peek()! : -1
    }
    
    func tests() {
        var root = TreeNode(
            5,
            TreeNode(8, TreeNode(2, 4, 6), 1),
            TreeNode(9, 3, 7)
        )
        print(kthLargestLevelSum(root, 2)) // 13
        root = TreeNode(1, TreeNode(2, 3, nil), nil)
        print(kthLargestLevelSum(root, 1)) // 3
        print(kthLargestLevelSum(root, 3)) // 1
        print(kthLargestLevelSum(root, 4)) // -1
    }
}

