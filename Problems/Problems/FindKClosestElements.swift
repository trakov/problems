class FindKClosestElements {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        let n = arr.count
        guard k < n else { return arr }
        if x <= arr[0] { return Array(arr.prefix(k)) }
        if x >= arr[n - 1] { return Array(arr.suffix(k)) }
        var left = 0
        var right = n - k
        while left < right {
            let mid = (left + right) / 2
            if x - arr[mid] > arr[mid + k] - x {
                left = mid + 1
            } else {
                right = mid
            }
        }
        var result = Array(repeating: 0, count: k)
        for i in 0..<k {
            result[i] = arr[i + left]
        }
        return result
    }

    func tests() {
        print(findClosestElements([1,2,3,4,5], 4, 3)) // [1,2,3,4]
        print(findClosestElements([1,2,3,4,5], 4, -1)) // [1,2,3,4]
        print(findClosestElements([1,1,1,10,10,10], 1, 9)) // 10
        print(findClosestElements([0,0,1,2,3,3,4,7,7,8], 3, 5)) // [3,3,4]
    }
}

