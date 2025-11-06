import Collections

final class FindXSumofAllKLongSubarraysII { // TLE
    struct Pair: Comparable, Hashable {
        let first: Int
        let second: Int

        static func < (lhs: Pair, rhs: Pair) -> Bool {
            if lhs.first != rhs.first {
                return lhs.first < rhs.first
            }
            return lhs.second < rhs.second
        }
    }

    final class Helper {
        private let x: Int
        private var result = 0
        private var large = TreeSet<Pair>()
        private var small = TreeSet<Pair>()
        private var occ: [Int: Int] = [:]
        
        init(x: Int) {
            self.x = x
        }
        
        func insert(_ num: Int) {
            if let count = occ[num], count > 0 {
                internalRemove(Pair(first: count, second: num))
            }
            occ[num, default: 0] += 1
            internalInsert(Pair(first: occ[num]!, second: num))
        }
        
        func remove(_ num: Int) {
            guard let count = occ[num], count > 0 else { return }
            internalRemove(Pair(first: count, second: num))
            occ[num] = count - 1
            if occ[num]! > 0 {
                internalInsert(Pair(first: occ[num]!, second: num))
            }
        }
        
        func get() -> Int {
            result
        }
        
        private func internalInsert(_ p: Pair) {
            if large.count < x || p > large.min()! {
                result += p.first * p.second
                large.insert(p)
                if large.count > x {
                    let toRemove = large.min()!
                    result -= toRemove.first * toRemove.second
                    large.remove(toRemove)
                    small.insert(toRemove)
                }
            } else {
                small.insert(p)
            }
        }
        
        private func internalRemove(_ p: Pair) {
            if let minLarge = large.min(), p >= minLarge {
                result -= p.first * p.second
                large.remove(p)
                if let toAdd = small.max() {
                    result += toAdd.first * toAdd.second
                    small.remove(toAdd)
                    large.insert(toAdd)
                }
            } else {
                small.remove(p)
            }
        }
    }

    func findXSum(_ nums: [Int], _ k: Int, _ x: Int) -> [Int] {
        let helper = Helper(x: x)
        var ans: [Int] = []
        
        for i in 0..<nums.count {
            helper.insert(nums[i])
            if i >= k {
                helper.remove(nums[i - k])
            }
            if i >= k - 1 {
                ans.append(helper.get())
            }
        }
        return ans
    }
    
    func tests() {
        print(findXSum([1,1,2,2,3,4,2,3], 6, 2)) // [6,10,12]
        print(findXSum([3,8,7,8,7,5], 2, 2)) // [11,15,15,15,12]
    }
}
