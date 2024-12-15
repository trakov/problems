// import HeapModule

class MaximumAveragePassRatio {
    struct Class: Comparable {
        let pass: Int
        let total: Int
        var gain: Double {
            let (pass, total) = (Double(pass), Double(total))
            return (pass + 1) / (total + 1) - pass / total
        }
        static func < (lhs: Class, rhs: Class) -> Bool {
            lhs.gain < rhs.gain
        }
    }

    func maxAverageRatio(_ classes: [[Int]], _ extraStudents: Int) -> Double {
//        var classes = Heap(classes.map { Class(pass: $0[0], total: $0[1])} )
        var classes = Heap(array: classes.map { Class(pass: $0[0], total: $0[1])}, sort: >)
        for _ in 0..<extraStudents {
            if let maxGainClass = classes.remove() {
                let updatedClass = Class(
                    pass: maxGainClass.pass + 1, total: maxGainClass.total + 1
                )
                classes.insert(updatedClass)
            }
        }
//        return classes.unordered.reduce(0) {
        return classes.nodes.reduce(0) {
            $0 + Double($1.pass) / Double($1.total)
        } / Double(classes.count)
    }
    
    func tests() {
        print(maxAverageRatio([[1,2],[3,5],[2,2]], 2)) // 0.78333
        print(maxAverageRatio([[2,4],[3,9],[4,5],[2,10]], 4)) // 0.53485
    }
}

