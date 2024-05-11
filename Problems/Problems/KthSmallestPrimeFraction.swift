class KthSmallestPrimeFraction {
    func kthSmallestPrimeFraction(_ arr: [Int], _ k: Int) -> [Int] {
        let n = arr.count
        guard n > 1 && k > 0 else { return [] }
        var left = 0.0
        var right = 1.0
        while left < right {
            let mid = (left + right) / 2.0
            var count = 0
            var maxFraction: [Int] = [0, 1]
            var j = 1
            for i in 0..<n {
                while j < n && Double(arr[i]) >= mid * Double(arr[j]) {
                    j += 1
                }
                count += n - j
                if j < n && maxFraction[0] * arr[j] < arr[i] * maxFraction[1] {
                    maxFraction = [arr[i], arr[j]]
                }
            }
            if count == k {
                return maxFraction
            } else if count < k {
                left = mid
            } else {
                right = mid
            }
        }
        return []
    }
    
    func tests() {
        print(kthSmallestPrimeFraction([1,2,3,5], 3)) // [2,5]
        print(kthSmallestPrimeFraction([1,7], 1)) // [1,7]
    }
}

