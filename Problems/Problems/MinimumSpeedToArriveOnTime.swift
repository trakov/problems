class MinimumSpeedToArriveOnTime {
    func minSpeedOnTime(_ dist: [Int], _ hour: Double) -> Int {
//        guard dist.count > 1 else {
//            return Int((Double(dist[0])/hour).rounded(.up))
//        }
        guard Double(dist.count - 1) < hour else { return -1 }
        
        var left = 1
        var right = dist.max()!
        
        if hour != hour.rounded(.down) {
            right = max(
                right,
                Int((Double(dist.last!)/(hour - hour.rounded(.down))).rounded(.up))
            )
        }
        
        func totalTime(_ speed: Int) -> Double {
            var time = 0.0
            for d in dist.dropLast() {
                time += (Double(d)/Double(speed)).rounded(.up)
            }
            time += (Double(dist.last!)/Double(speed))
            return time
        }
        
        while left < right {
            let mid = (left + right) / 2
            if totalTime(mid).isLessThanOrEqualTo(hour) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        
        return left
    }
    
    func tests() {
        print(minSpeedOnTime([69], 4.6)) // 15
//        print(minSpeedOnTime([1,3,2], 6)) // 1
//        print(minSpeedOnTime([1,3,2], 2.7)) // 3
//        print(minSpeedOnTime([1,3,2], 1.9)) // -1
//        print(minSpeedOnTime([1,1,100000], 2.01)) // 10_000_000
    }
}

