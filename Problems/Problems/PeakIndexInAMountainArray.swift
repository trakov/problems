class PeakIndexInAMountainArray {
    func peakIndexInMountainArray(_ arr: [Int]) -> Int {
        var left = 0
        var right = arr.count - 1
        while left <= right {
            let mid = max((left + right) / 2, 1)
            if arr[mid] > arr[mid-1] && arr[mid] > arr[mid+1] {
                return mid
            }
            if arr[mid] < arr[mid-1] {
                right = mid-1
            } else {
                left = mid+1
            }
        }
        return left
    }

    func tests() {
        print(peakIndexInMountainArray([0,1,0])) // 1
        print(peakIndexInMountainArray([0,2,1,0])) // 1
        print(peakIndexInMountainArray([0,10,5,2])) // 1
        print(peakIndexInMountainArray([0,10,5,2,1])) // 1
        print(peakIndexInMountainArray([0,4,5,2])) // 2
        print(peakIndexInMountainArray([0,4,5,6,7,2])) // 4
    }
}
