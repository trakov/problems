final class FindTwoNonoverlappingSubarraysEachWithTargetSum {
    func minSumOfLengths(_ arr: [Int], _ target: Int) -> Int {
        let n = arr.count
        var best = Array(repeating: n + 1, count: n)
        var left = 0
        var sum = 0
        var answer = n + 1
        for right in 0..<n {
            sum += arr[right]
            while sum > target {
                sum -= arr[left]
                left += 1
            }
            if sum == target {
                let len = right - left + 1
                if left > 0 && best[left - 1] < n + 1 {
                    answer = min(answer, len + best[left - 1])
                }
                best[right] = len
            }
            if right > 0 {
                best[right] = min(best[right], best[right - 1])
            }
        }
        return answer <= n ? answer : -1
    }
    
    func tests() {
        print(minSumOfLengths([3,2,2,4,3], 3)) // 2
        print(minSumOfLengths([7,3,4,7], 7)) // 2
        print(minSumOfLengths([4,3,2,6,2,3,4], 6)) // -1
        print(minSumOfLengths([1,1,1,2,2,2,4,4], 6)) // 6
    }
}
