class SegmentTree {
    private var count: [Int]
    private var covered: [Int]
    private let xs: [Int]
    private let n: Int

    init(_ xs: [Int]) {
        self.xs = xs
        n = xs.count - 1
        count = Array(repeating: 0, count: 4 * n)
        covered = Array(repeating: 0, count: 4 * n)
    }

    private func modify(_ qleft: Int, _ qright: Int, _ qval: Int, _ left: Int, _ right: Int, _ pos: Int) {
        if xs[right + 1] <= qleft || xs[left] >= qright {
            return
        }
        if qleft <= xs[left] && xs[right + 1] <= qright {
            count[pos] += qval
        } else {
            let mid = (left + right) / 2
            modify(qleft, qright, qval, left, mid, pos * 2 + 1)
            modify(qleft, qright, qval, mid + 1, right, pos * 2 + 2)
        }

        if count[pos] > 0 {
            covered[pos] = xs[right + 1] - xs[left]
        } else {
            if left == right {
                covered[pos] = 0
            } else {
                covered[pos] = covered[pos * 2 + 1] + covered[pos * 2 + 2]
            }
        }
    }

    func update(_ qleft: Int, _ qright: Int, _ qval: Int) {
        modify(qleft, qright, qval, 0, n - 1, 0)
    }

    func query() -> Int {
        covered[0]
    }
}

final class SeparateSquaresII {
    func separateSquares(_ squares: [[Int]]) -> Double {
        var events: [(y: Int, d: Int, xl: Int, xr: Int)] = []
        var xsSet: Set<Int> = []
        for sq in squares {
            let (x, y, l) = (sq[0], sq[1], sq[2])
            let xr = x + l
            events.append((y, 1, x, xr))
            events.append((y + l, -1, x, xr))
            xsSet.insert(x)
            xsSet.insert(xr)
        }
        events.sort { $0.y < $1.y }
        let xs = Array(xsSet).sorted()
        let tree = SegmentTree(xs)
        var psum: Array<Int> = []
        var widths: Array<Int> = []
        var totalArea = 0
        var prev = events[0].y
        for event in events {
            let len = tree.query()
            totalArea += len * (event.y - prev)
            tree.update(event.xl, event.xr, event.d)
            psum.append(totalArea)
            widths.append(tree.query())
            prev = event.y
        }
        let target = (totalArea + 1) / 2
        let i = binarySearch(psum, target)
        let area = psum[i]
        let width = widths[i]
        let height = events[i].y
        return Double(height) + Double(totalArea - area * 2) / Double(width * 2)
    }

    func binarySearch(_ list: [Int], _ target: Int) -> Int {
        var (left, right) = (0, list.count - 1)
        var result = 0
        while left <= right {
            let mid = left + (right - left) / 2
            if list[mid] < target {
                result = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return result
    }
    
    func tests() {
        print(separateSquares([[0,0,1],[2,2,1]])) // 1
        print(separateSquares([[0,0,2],[1,1,1]])) // 1
    }
}
