final class TakingMaximumEnergyFromtheMysticDungeon {
    func maximumEnergy(_ energy: [Int], _ k: Int) -> Int {
        func maxSuffix(_ i: Int) -> Int {
            var (curSum, maxSum) = (0, Int.min)
            var i = energy.count - 1 - i
            while i >= 0 {
                curSum += energy[i]
                maxSum = max(maxSum, curSum)
                i -= k
            }
            return maxSum
        }
        var result = Int.min
        for i in 0..<k {
            result = max(result, maxSuffix(i))
        }
        return result
    }
    
    func tests() {
        print(maximumEnergy([5,2,-10,-5,1], 3)) // 3
        print(maximumEnergy([-2,-3,-1], 2)) // -1
    }
}
