final class MaximumNestingDepthofTwoValidParenthesesStrings {
    func maxDepthAfterSplit(_ seq: String) -> [Int] {
        seq.enumerated().map { (i, c) in
            (i & 1) ^ (c == "(" ? 1 : 0)
        }
    }
    
    func tests() {
        print(maxDepthAfterSplit("(()())")) // [0,1,1,1,1,0]
        print(maxDepthAfterSplit("()(())()")) // [0,0,0,1,1,0,1,1]
    }
}
