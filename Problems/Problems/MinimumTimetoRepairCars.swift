class MinimumTimetoRepairCars {
    func repairCars(_ ranks: [Int], _ cars: Int) -> Int {
        if ranks.count == 1 { return ranks[0] * cars * cars }
        var (left, right) = (0, (ranks.max() ?? 0) * cars * cars)
        func repairPossible(_ mid: Int) -> Bool {
            var count = 0
            for rank in ranks {
                let nos = Int((Double(mid/rank)).squareRoot())
                count += nos
            }
            return count >= cars
        }
        while left < right {
            let mid = left + (right-left)/2
            if repairPossible(mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
    
    func tests() {
        print(repairCars([4,2,3,1], 10)) // 16
        print(repairCars([5,1,8], 6)) // 16
    }
}
