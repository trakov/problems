class ProductoftheLastKNumbers {
    private var prefix: [Int] = [1]
    private var count = 0

    init() {}
    
    func add(_ num: Int) {
        if num == 0 {
            prefix = [1]
            count = 0
        } else {
            prefix.append(prefix[count] * num)
            count += 1
        }
    }
    
    func getProduct(_ k: Int) -> Int {
        guard k <= count else { return 0 }
        return prefix[count] / prefix[count - k]
    }

    func tests() {
        print(add(3)) //
        print(add(0)) //
        print(add(2)) //
        print(add(5)) //
        print(add(4)) //
        print(getProduct(2)) // 20
        print(getProduct(3)) // 40
        print(getProduct(4)) // 0
        print(add(8)) //
        print(getProduct(2)) // 32
    }
}

