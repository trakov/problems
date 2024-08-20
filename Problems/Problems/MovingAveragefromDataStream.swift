class MovingAveragefromDataStream {
    class MovingAverage {
        private let size: Int
        private var curSize = 0
        private var sum = 0
        private var index = 0
        private var arr: [Int]
        init(_ size: Int) {
            self.size = size
            arr = Array(repeating: 0, count: size)
        }
        
        func next(_ val: Int) -> Double {
            sum -= arr[index]
            arr[index] = val
            sum += arr[index]
            index = (index + 1) % size
            curSize = min(curSize + 1, size)
            return Double(sum) / Double(curSize)
        }
    }
    
    func tests() {
        let ma = MovingAverage(3)
        print(ma.next(1)) // 1.0
        print(ma.next(10)) // 5.5
        print(ma.next(3)) // 4.66667
        print(ma.next(5)) // 6.0
    }
}
