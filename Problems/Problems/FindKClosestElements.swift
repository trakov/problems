class FindKClosestElements {
    func findClosestElements(_ arr: [Int], _ k: Int, _ x: Int) -> [Int] {
        guard arr.count < k else { return arr }
        guard arr.first! > x else { return Array(arr.prefix(k)) }
        guard arr.last! < x else { return Array(arr.suffix(k)) }
        // find min index where x >= arr[index]
        var left = 0
        var right = arr.count - 1
        while left < right {
            let mid = (left + right) / 2
            if x < arr[mid] {
                left = mid + 1
            } else {
                right = mid
            }
        }
        
        return arr
    }
    
    func tests() {
        print(findClosestElements([1,2,3,4,5], 4, 3)) // [1,2,3,4]
        print(findClosestElements([1,2,3,4,5], 4, -1)) // [1,2,3,4]
    }
}

