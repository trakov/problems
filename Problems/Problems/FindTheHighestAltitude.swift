class FindTheHighestAltitude {
    func largestAltitude(_ gain: [Int]) -> Int {
        var result = 0
        var cur = 0
        for diff in gain {
            cur += diff
            result = max(result, cur)
        }
        return result
    }
    
    func tests() {
        print(largestAltitude([-5,1,5,0,-7])) // 1
        print(largestAltitude([-4,-3,-2,-1,4,3,2])) // 0
    }
}

