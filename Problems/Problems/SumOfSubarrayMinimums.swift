class SumOfSubarrayMinimums {
    func sumSubarrayMins(_ arr: [Int]) -> Int {
        guard !arr.isEmpty else { return 0 }
        if arr.count == 1 { return arr[0] }
        var sum = 0
        for i in 0 ..< arr.count {
            var m = arr[i]
            for j in i ..< arr.count {
                m = min(m, arr[j])
                sum += m
            }
        }
        
        return sum % 1000000007
    }
    
    func tests() {
        print(sumSubarrayMins([3,1,2,4])) // 17
        print(sumSubarrayMins([11,81,94,43,3])) // 444
    }
}
