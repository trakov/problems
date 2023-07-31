class FindTheLongestValidObstacleCourseAtEachPosition {
    private func bisectRight(_ lis: [Int], target: Int, right: Int) -> Int {
        guard right != 0 else { return 0 }
        var left = 0
        var right = right
        while left < right {
            let mid = left + (right - left) / 2
            if lis[mid] <= target {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
    
    func longestObstacleCourseAtEachPosition(_ obstacles: [Int]) -> [Int] {
        let n = obstacles.count
        var lisLength = 0
        var result = Array(repeating: 0, count: n)
        var lis = Array(repeating: 0, count: n)
        for (i, height) in obstacles.enumerated() {
            let idx = bisectRight(lis, target: height, right: lisLength)
            if idx == lisLength {
                lisLength += 1
            }
            lis[idx] = height
            result[i] = idx + 1
        }
        return result
    }

    func longestObstacleCourseAtEachPosition2(_ obstacles: [Int]) -> [Int] {
        let n = obstacles.count
        var result = Array(repeating: 1, count: n)
        for i in 1..<n {
            for j in (0..<i).reversed() {
                guard obstacles[j] <= obstacles[i] else { continue }
                result[i] = max(result[i], result[j] + 1)
                if obstacles[j] == obstacles[i] {
                    break
                }
            }
        }
        return result
    }
    
    func tests() {
        print(longestObstacleCourseAtEachPosition([5,1,5,5,1,3,4,5,1,4]))
        // [1,1,2,3,2,3,4,5,3,5]
        print(longestObstacleCourseAtEachPosition([1,2,3,2])) // [1,2,3,3]))
        print(longestObstacleCourseAtEachPosition([2,2,1])) // [1,2,1]
        print(longestObstacleCourseAtEachPosition([3,1,5,6,4,2])) // [1,1,2,3,2,2]
    }
}

