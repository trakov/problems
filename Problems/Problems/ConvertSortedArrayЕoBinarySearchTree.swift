class ConvertSortedArrayЕoBinarySearchTree {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        recursive(nums, leftIndex: 0, rightIndex: nums.count - 1)
//        guard nums.count > 0 else { return nil }
//        var index = Int(nums.count / 2)
//        var tree = TreeNode(nums[index])
//        var node: TreeNode?
//        while node != nil {
//            node =
//        }
//
//        return tree
    }
    
    func recursive(_ nums: [Int], leftIndex: Int, rightIndex: Int) -> TreeNode? {
        guard leftIndex < rightIndex else { return nil }
        let middleIndex: Int = (leftIndex + rightIndex) / 2
        
        return TreeNode(
            nums[middleIndex],
            recursive(nums, leftIndex: leftIndex, rightIndex: middleIndex - 1),
            recursive(nums, leftIndex: middleIndex + 1, rightIndex: rightIndex)
        )
    }
    
    func tests() {
        
    }
}
