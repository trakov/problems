class MinimumNumberofOperationstoMakeArrayXOREqualtoK {
    func minOperations(_ nums: [Int], _ k: Int) -> Int {
        (nums.reduce(0, ^) ^ k).nonzeroBitCount
    }
    
    func tests() {
        print(minOperations([2,1,3,4], 1)) // 2
        print(minOperations([2,0,2,0], 0)) // 0
    }
}

