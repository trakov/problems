class FindtheStudentthatWillReplacetheChalk {
    func chalkReplacer(_ chalk: [Int], _ k: Int) -> Int {
        let n = chalk.count
        guard n > 1 else { return 0 }
        let sum = chalk.reduce(0, +)
        let rem = k % sum
        var temp = 0
        for (i, c) in chalk.enumerated() {
            if temp + c <= rem {
                temp += c
            } else {
                return i
            }
        }
        return -1
    }
    
    func tests() {
        print(chalkReplacer([5,1,5], 22)) // 0
        print(chalkReplacer([3,4,1,2], 25)) // 1
    }
}

