class MinimumNumberofDaystoMakemBouquets {
    func minDays(_ bloomDay: [Int], _ m: Int, _ k: Int) -> Int {
        let n = bloomDay.count
        guard m * k <= n else { return -1 }
        var left = bloomDay.min()!
        var right = bloomDay.max()!
        if m * k == n { return right }
        
        func bouquets(_ day: Int) -> Int {
            var count = 0
            var temp = 0
            for d in bloomDay {
                if d <= day {
                    temp += 1
                } else {
                    count += temp / k
                    temp = 0
                }
            }
            return count + temp / k
        }

        while left < right {
            let mid = (left + right) / 2
            if bouquets(mid) < m {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
    
    func tests() {
        print(minDays([1,10,3,10,2], 3, 1)) // 3
        print(minDays([1,10,3,10,2], 3, 2)) // -1
        print(minDays([7,7,7,7,12,7,7], 2, 3)) // 12
    }
}

