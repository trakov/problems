class CheckIfNandItsDoubleExist {
    func checkIfExist(_ arr: [Int]) -> Bool {
        let arr = arr.sorted()
        for (i, n) in arr.enumerated() {
            var target = n * 2
            if n < 0 {
                if n % 2 != 0 {
                    continue
                } else {
                    target = n / 2
                }
            }
            var left = i + 1
            var right = arr.count - 1
            while left <= right {
                let mid = (left + right) / 2
                if arr[mid] < target {
                    left = mid + 1
                } else if arr[mid] > target {
                    right = mid - 1
                } else {
                    return true
                }
            }
        }
        return false
    }

    func tests() {
        print(checkIfExist([0,0])) // true
        print(checkIfExist([10,2,5,3])) // true
        print(checkIfExist([3,1,7,11])) // false
    }
}
