class MaximumSwap {
    func maximumSwap(_ num: Int) -> Int {
        var arr = String(num).map { $0.wholeNumberValue! }
        var last = Array(repeating: -1, count: 10)
        for (i, val) in arr.enumerated() {
            last[val] = i
        }
        for i in 0..<arr.count {
            for d in (0...9).reversed() where d > arr[i] && last[d] > i {
                arr.swapAt(i, last[d])
                var result = 0
                for val in arr {
                    result = result * 10 + val
                }
                return result
            }
        }
        return num
    }
    
    func tests() {
        print(maximumSwap(10)) // 10
        print(maximumSwap(2736)) // 7236
        print(maximumSwap(9973)) // 9973
    }
}

