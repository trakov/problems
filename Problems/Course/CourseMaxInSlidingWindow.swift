class CourseMaxInSlidingWindow {
    var n = 0//Int(readLine()!)!
    var array: [Int] = []// readLine()!.split(separator: " ").map { Int($0)! }
    var m = 0//Int(readLine()!)!
    
    func find() {
        var result: [Int] = []
        var stack1: [(Int, Int)] = []
        var stack2: [(Int, Int)] = []
        
        for a in array {
            if stack1.count < m {
                let mm = stack1.last?.1 ?? 0
                stack1.append((a, max(a, mm)))
            }
        }
        
        
        for r in result {
            print(r, terminator: " ")
        }
    }
    
    func tests() {
        n = 3
        array = [2, 1, 5]
        m = 1
        
        find()
    }
}
