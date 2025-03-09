class AlternatingGroupsII {
    func numberOfAlternatingGroups(_ colors: [Int], _ k: Int) -> Int {
        let n = colors.count
        var result = 0
        var alternatingElementsCount = 1
        var lastColor = colors[0]
        for i in 1..<n+k-1 {
            let index = i % n
            if colors[index] == lastColor {
                alternatingElementsCount = 1
                lastColor = colors[index]
                continue
            }
            alternatingElementsCount += 1
            if alternatingElementsCount >= k {
                result += 1
            }
            lastColor = colors[index]
        }
        return result
    }
    
    func tests() {
        print(numberOfAlternatingGroups([0,1,0,1,0], 3)) // 3
        print(numberOfAlternatingGroups([0,1,0,0,1,0,1], 6)) // 2
        print(numberOfAlternatingGroups([1,1,0,1], 4)) // 0
    }
}

