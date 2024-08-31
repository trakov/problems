class Heaters {
    func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {
        let houses = houses.sorted()
        let heaters = heaters.sorted()
        let n = houses.count
        let m = heaters.count
        var left = 0
        var right = max(
            abs(heaters[0] - houses[n - 1]),
            abs(heaters[m - 1] - houses[0])
        )

        func isCovered(_ radius: Int) -> Bool {
            var i = 0
            for heater in heaters {
                while i < n
                        && houses[i] >= heater - radius
                        && houses[i] <= heater + radius {
                    i += 1
                }
                if i == n { return true }
            }
            return false
        }
        
        var minRadius = Int.max
        while left <= right {
            let mid = (left + right) / 2
            if isCovered(mid) {
                minRadius = mid
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return minRadius
    }
    
    func tests() {
        print(findRadius([1,2,3], [2])) // 1
        print(findRadius([1,2,3,4], [1,4])) // 1
        print(findRadius([1,5], [2])) // 3
    }
}

