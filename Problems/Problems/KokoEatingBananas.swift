import Foundation
class KokoEatingBananas {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        guard piles.count <= h else { return -1 }
        guard piles.count < h else { return piles.max()! }
        
        var left = 1
        var right = piles.max()!

        var minMid = Int.max
        while left <= right {
            let mid = (left + right) / 2
            var time = 0
            for pile in piles {
                time += pile/mid
                if pile % mid != 0 {
                    time += 1
                }
            }
            if time <= h {
                minMid = min(minMid, mid)
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return minMid
    }

    func tests() {
        print(minEatingSpeed([312884470], 312884469)) // 2
        print(minEatingSpeed([3,6,7,11], 8)) // 4
        print(minEatingSpeed([30,11,23,4,20], 5)) // 30
        print(minEatingSpeed([30,11,23,4,20], 6)) // 23
    }
}
