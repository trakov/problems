final class MinimumNumberofSecondstoMakeMountainHeightZero {
    func minNumberOfSeconds(_ mountainHeight: Int, _ workerTimes: [Int]) -> Int {
        let EPS = 1e-7
        let maxWorkerTimes = workerTimes.max()!
        var l = 1
        var r = (maxWorkerTimes * mountainHeight * (mountainHeight + 1)) / 2
        var result = 0
        while l <= r {
            let mid = (l + r) / 2
            var cnt = 0
            for t in workerTimes {
                let work = mid / t
                let k = Int((-1.0 + Double(1 + work * 8).squareRoot()) / 2 + EPS)
                cnt += k
            }
            if cnt >= mountainHeight {
                result = mid
                r = mid - 1
            } else {
                l = mid + 1
            }
        }
        return result
    }
    
    func tests() {
        print(minNumberOfSeconds(4, [2,1,1])) // 3
        print(minNumberOfSeconds(10, [3,2,2,4])) // 12
        print(minNumberOfSeconds(5, [1])) // 15
    }
}
