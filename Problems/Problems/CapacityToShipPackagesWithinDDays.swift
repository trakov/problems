class CapacityToShipPackagesWithinDDays {
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        guard weights.count > 1 else { return weights[0] }
        var left = 0
        var right = 0
        for weight in weights {
            left = max(left, weight)
            right += weight
        }
        
        func isSolution(with capacity: Int) -> Bool {
            var queue: [Int] = [0]
            for weight in weights {
                if queue.last! + weight <= capacity {
                    queue[queue.count - 1] += weight
                } else {
                    queue.append(weight)
                }
                if queue.count > days {
                    return false
                }
            }
            return true
        }
        
        while left < right {
            let mid = (left + right) / 2
            if isSolution(with: mid) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }

    func shipWithinDays2(_ weights: [Int], _ days: Int) -> Int {
        guard weights.count > 1 else { return weights[0] }
        var result = weights.max()!
        var queue: [Int] = [0]
        var i = 0
        while i < weights.count {
            let w = weights[i]
            if queue.last! + w <= result {
                queue[queue.count - 1] += w
            } else {
                queue.append(w)
            }
            if queue.count > days {
                result += 1
                i = 0
                queue = [0]
            } else {
                i += 1
            }
        }
        return result
    }

    func tests() {
        print(shipWithinDays([1,2,3,4,5,6,7,8,9,10], 5)) // 15
        print(shipWithinDays([3,2,2,4,1,4], 3)) // 6
        print(shipWithinDays([1,2,3,1,1], 4)) // 3
    }
}
