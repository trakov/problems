class KRadiusSubarrayAverages {
    func getAverages(_ nums: [Int], _ k: Int) -> [Int] {
        guard k > 0 else { return nums }
        let n = nums.count
        var result = Array(repeating: -1, count: n)
        let div = 2 * k + 1
        guard div <= n else { return result }
        var sum = 0
        for (i, num) in nums.enumerated() {
            sum += num
            guard i >= div - 1 else { continue }
            let leftDeleteIndex = i - div
            if leftDeleteIndex >= 0 {
                sum -= nums[leftDeleteIndex]
            }
            result[i - k] = sum / div
        }
        
        return result
    }
    
    func tests() {
        print(getAverages([7,4,3,9,1,8,5,2,6], 3)) // [-1,-1,-1,5,4,4,-1,-1,-1]
        print(getAverages([100000], 0)) // [100000]
        print(getAverages([8], 100000)) // [-1]
    }
}

