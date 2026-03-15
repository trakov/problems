final class FancySequence {
    enum Op {
        case add(Int)
        case mult(Int)
    }
    private var ops: [Op] = []
    private var nums: [Int] = []
    private let MOD = 1_000_000_007
    init() {}
    
    func append(_ val: Int) {
        applyOps()
        nums.append(val)
    }
    
    func addAll(_ inc: Int) {
        if let lastOp = ops.last, case .add(let lastInc) = lastOp {
            ops[ops.count - 1] = .add(lastInc + inc)
            return
        }
        ops.append(.add(inc))
    }
    
    func multAll(_ m: Int) {
        if let lastOp = ops.last, case .mult(let lastM) = lastOp {
            ops[ops.count - 1] = .mult((lastM % MOD) * (m % MOD))
            return
        }
        ops.append(.mult(m))
    }
    
    func getIndex(_ idx: Int) -> Int {
        guard idx < nums.count else { return -1 }
        applyOps()
        return nums[idx]
    }
    
    private func applyOps() {
        for op in ops {
            switch op {
            case let .add(val): nums = nums.map { ($0 + val) % MOD }
            case let .mult(val): nums = nums.map { ($0 * val) % MOD }
            }
        }
        ops = []
    }
    
    func tests() {
        let fancy = FancySequence()
        fancy.append(2)   // fancy sequence: [2]
        fancy.addAll(3)   // fancy sequence: [2+3] -> [5]
        fancy.append(7)   // fancy sequence: [5, 7]
        fancy.multAll(2)  // fancy sequence: [5*2, 7*2] -> [10, 14]
        print(fancy.getIndex(0)) // return 10
        fancy.addAll(3)   // fancy sequence: [10+3, 14+3] -> [13, 17]
        fancy.append(10)  // fancy sequence: [13, 17, 10]
        fancy.multAll(2)  // fancy sequence: [13*2, 17*2, 10*2] -> [26, 34, 20]
        print(fancy.getIndex(0)) // return 26
        print(fancy.getIndex(1)) // return 34
        print(fancy.getIndex(2)) // return 20
    }
}
