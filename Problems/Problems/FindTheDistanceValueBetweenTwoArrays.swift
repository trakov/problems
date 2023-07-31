class FindTheDistanceValueBetweenTwoArrays {
    func findTheDistanceValue(_ arr1: [Int], _ arr2: [Int], _ d: Int) -> Int {
        let arr1 = arr1.sorted()
        let arr2 = arr2.sorted()
        var result = 0
        var left = 0
        var right = arr2.count - 1
        for a1 in arr1 {
            right = arr2.count - 1
            result += 1
            while left <= right {
                let mid = (left + right) / 2
                if arr2[mid] - d <= a1 && arr2[mid] + d >= a1 {
                    result -= 1
                    break
                }
                if arr2[mid] < a1 {
                    left = mid + 1
                }
                if arr2[mid] > a1 {
                    right = mid - 1
                }
            }
        }
        
        return result
    }

    func tests() {
        print(findTheDistanceValue([4,5,8], [10,9,1,8], 2)) // 2
        print(findTheDistanceValue([1,4,2,3], [-4,-3,6,10,20,30], 3)) // 2
        print(findTheDistanceValue([2,1,100,3], [-5,-2,10,-3,7], 6)) // 1
    }
}
