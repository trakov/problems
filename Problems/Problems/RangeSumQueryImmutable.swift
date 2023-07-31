class RangeSumQueryImmutable {
    private var sums: [Int] = [-2, 0, 3, -5, 2, -1]
    
    convenience init(_ nums: [Int]) {
        self.init()
        self.sums = prepareSums(with: nums)
    }
    
    init() {
        self.sums = prepareSums(with: sums)
    }
    
    func prepareSums(with nums: [Int]) -> [Int] {
        var s = 0
        return nums.map { s += $0; return s }
    }
    
    func sumRange(_ left: Int, _ right: Int) -> Int {
        sums[right] - (left > 0 ? sums[left - 1] : 0)
    }

    func tests() {
        print(sumRange(0, 2)) // 1
        print(sumRange(2, 5)) // -1
        print(sumRange(0, 5)) // -3
    }
}
