class Sqrt {
    func mySqrt(_ x: Int) -> Int {
        guard x > 0 else { return 0 }
        guard x > 3 else { return 1 }
        var max = x / 2
        var min = 2
        while min < max {
            let k = (max + min) / 2
            if k * k > x {
                max = k
            } else if (k + 1) * (k + 1) > x {
                return k
            } else {
                min = k
            }
        }
        return min
    }

    func tests() {
        print(mySqrt(1764975709)) // 42011
        print(mySqrt(1)) // 1
        print(mySqrt(2)) // 1
        print(mySqrt(3)) // 1
        print(mySqrt(4)) // 2
        print(mySqrt(8)) // 2
        print(mySqrt(20)) // 4
    }
}
