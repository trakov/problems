class MinimumAmountOfTimeToCollectGarbage {
    func garbageCollection(_ garbage: [String], _ travel: [Int]) -> Int {
        var result = 0
        var m = -1
        var p = -1
        var g = -1
        for (i, garb) in garbage.enumerated().reversed() {
            if m == -1 && garb.contains("M") { m = i }
            if p == -1 && garb.contains("P") { p = i }
            if g == -1 && garb.contains("G") { g = i }
            result += garb.count
        }
        var sum = 0
        let travel = travel.map { sum += $0; return sum }
        for index in [m, p, g] where index > 0 {
            result += travel[index - 1]
        }
        return result
    }
    
    func tests() {
        print(garbageCollection(["G","P","GP","GG"], [2,4,3])) // 21
        print(garbageCollection(["MMM","PGM","GP"], [3,10])) // 37
    }
}

