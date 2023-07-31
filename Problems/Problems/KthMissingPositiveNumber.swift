class KthMissingPositiveNumber {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var left = 0
        var right = arr.count - 1
        while left <= right {
            let mid = (left + right) / 2
            if arr[mid] - (mid + 1) < k {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return left + k
    }

    func tests() {
        print(findKthPositive([2,3,4,7,11], 5)) // 9
        print(findKthPositive([1,2,3,4], 2)) // 6
        print(findKthPositive([1,2,4], 1)) // 3
        print(findKthPositive([1,2,4], 2)) // 5
    }
}
