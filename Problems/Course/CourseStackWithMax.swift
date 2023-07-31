class CourseStackWithMax {
    
    var stack: [Int] = []
    var maxStack: [Int] = []
    var result: [Int] = []
    func tests() {
        var t = tt[1]
        var q = Int(t[0])!
        while q > 0 {
            let operation = t[t.count - q].split(separator: " ")
            if operation[0] == "push" {
                let num = Int(operation[1])!
                stack.append(num)
                maxStack.append(max(maxStack.last ?? num, num))
            } else if operation[0] == "pop" {
                stack.removeLast()
                maxStack.removeLast()
            } else if let lastMax = maxStack.last {
                result.append(lastMax)
            }
            q -= 1
        }
        for r in result {
            print(r)
        }
    }
    
    lazy var tt: [[String]] = {
        [
            [
                "5",
                "push 2",
                "push 1",
                "max",
                "pop",
                "max"
            ],
            [
                "10",
                "push 2",
                "push 3",
                "push 9",
                "push 7",
                "push 2",
                "max",
                "max",
                "max",
                "pop",
                "max"
            ]
        ]
    }()
}
