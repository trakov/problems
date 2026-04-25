final class MaximizetheDistanceBetweenPointsonaSquare {
    func maxDistance(_ side: Int, _ points: [[Int]], _ k: Int) -> Int {
        var arr: [Int] = []
        for p in points {
            let (x, y) = (p[0], p[1])
            if x == 0 {
                arr.append(y)
            } else if y == side {
                arr.append(side + x)
            } else if x == side {
                arr.append(side * 3 - y)
            } else {
                arr.append(side * 4 - x)
            }
        }
        arr.sort()
        var (lo, hi) = (1, side)
        var result = 0
        func check(_ limit: Int) -> Bool {
            func lowerBound(_ target: Int) -> Int {
                var (left, right) = (0, arr.count)
                while left < right {
                    let mid = left + (right - left) / 2
                    if arr[mid] < target {
                        left = mid + 1
                    } else {
                        right = mid
                    }
                }
                return left
            }
            let perimeter = side * 4
            for start in arr {
                let end = start + perimeter - limit
                var cur = start
                for _ in 0..<k-1 {
                    let idx = lowerBound(cur + limit)
                    if idx == arr.count || arr[idx] > end {
                        cur = -1
                        break
                    }
                    cur = arr[idx]
                }
                if cur >= 0 {
                    return true
                }
            }
            return false
        }
        while lo <= hi {
            let mid = (lo + hi) / 2
            if check(mid) {
                lo = mid + 1
                result = mid
            } else {
                hi = mid - 1
            }
        }
        return result
    }

    func tests() {
        print(maxDistance(2, [[0,2],[2,0],[2,2],[0,0]], 4)) // 2
        print(maxDistance(2, [[0,0],[1,2],[2,0],[2,2],[2,1]], 4)) // 1
        print(maxDistance(2, [[0,0],[0,1],[0,2],[1,2],[2,0],[2,2],[2,1]], 5)) // 1
    }
}
