class ConstructBinaryTreefromString {
    func construct(_ s: String) -> TreeNode? {
        guard !s.isEmpty else { return nil }
        let s = Array(s)
        var stack: [TreeNode] = []
        var i = 0
        
        func readNum(from i: Int) -> (num: Int, index: Int)? {
            var num = 0
            var isNegative = false
            var i = i
            if s[i] == "-" {
                isNegative = true
                i += 1
            }
            guard s[i].isNumber else { return nil }
            while i < s.count, let n = s[i].wholeNumberValue {
                num = num * 10 + n
                i += 1
            }
            return (isNegative ? -num : num, i - 1)
        }
        
        while i < s.count {
            if let (num, j) = readNum(from: i) {
                i = j
                stack.append(TreeNode(num))
            } else if s[i] == ")" {
                let last = stack.removeLast()
                if stack.last?.left == nil {
                    stack.last?.left = last
                } else {
                    stack.last?.right = last
                }
            }
            i += 1
        }
        return stack.first
    }
    
    func tests() {
        var root = construct("4(2(3)(1))(6(5))")
        print(root) // T(4, T(2,3,1), T(6,5,nil))
        
        root = construct("")
        print(root) //
    }
}

