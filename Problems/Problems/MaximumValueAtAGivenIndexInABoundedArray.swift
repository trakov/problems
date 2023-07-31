class MaximumValueAtAGivenIndexInABoundedArray {
    func maxValue(_ n: Int, _ index: Int, _ maxSum: Int) -> Int {
        guard n <= maxSum else { fatalError() }
        guard n < maxSum else { return 1 }
        guard n > 1 else { return maxSum }
        
        func minSum(_ i: Int, _ x: Int) -> Int {
            let sumLeft = (x <= i) ? (x*(x-1)/2 + i-x+1) : (i*(2*x - i-1)/2)
            let sumRight = (x <= n-1-i) ? (x*(x+1)/2 + n-i-x) : ((n-i)*(2*x - n+i+1)/2)
            return sumLeft + sumRight
        }
        
        var low = 1, mid = 0, high = (maxSum + 1) / 2
        while low < high {
            mid = (low + high + 1) / 2
            if minSum(index, mid) <= maxSum {
                low = mid
            } else {
                high = mid - 1
            }
        }
        
        return high
    }
    
    func tests() {
        print(maxValue(4, 2, 6)) // 2
        print(maxValue(6, 1, 10)) // 3
    }
}

