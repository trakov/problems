class ShortestSubarraytobeRemovedtoMakeArraySorted {
    func findLengthOfShortestSubarray(_ arr: [Int]) -> Int {
        var right = arr.count - 1
        while right > 0 && arr[right] >= arr[right - 1] {
            right -= 1
        }
        var result = right
        var left = 0
        while left < right && (left == 0 || arr[left - 1] <= arr[left]) {
            while right < arr.count && arr[left] > arr[right] {
                right += 1
            }
            result = min(result, right - left - 1)
            left += 1
        }
        return result
    }
    
    func tests() {
        print(findLengthOfShortestSubarray([1,2,3,10,4,2,3,5])) // 3
        print(findLengthOfShortestSubarray([5,4,3,2,1])) // 4
        print(findLengthOfShortestSubarray([1,2,3])) // 0
    }
}

