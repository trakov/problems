class MinimumTimeToMakeRopeColorful {
    func minCost(_ colors: String, _ neededTime: [Int]) -> Int {
        var result = 0
        var curColor = colors.first
        var curMax = neededTime[0]
        var curSum = neededTime[0]
        for (color, time) in zip(colors, neededTime).dropFirst() {
            if color == curColor {
                curSum += time
                curMax = max(time, curMax)
            } else {
                result += (curSum - curMax)
                curMax = time
                curSum = time
                curColor = color
            }
        }
        return result + curSum - curMax
    }
    
    func tests() {
        print(minCost("abaac", [1,2,3,4,5])) // 3
        print(minCost("abc", [1,2,3])) // 0
        print(minCost("aabaa", [1,2,3,4,1])) // 2
    }
}

