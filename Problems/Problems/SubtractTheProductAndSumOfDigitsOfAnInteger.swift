class SubtractTheProductAndSumOfDigitsOfAnInteger {
    func subtractProductAndSum(_ n: Int) -> Int {
        guard n > 10 else { return 0 }
        var n = n
        var product = 1
        var sum = 0
        while n != 0 {
            product *= n % 10
            sum += n % 10
            n /= 10
        }
        return product - sum
    }

    func tests() {
        print(subtractProductAndSum(0)) // 0
        print(subtractProductAndSum(2)) // 0
        print(subtractProductAndSum(20)) // -2
        print(subtractProductAndSum(234)) // 15
        print(subtractProductAndSum(4421)) // 21
    }
}
