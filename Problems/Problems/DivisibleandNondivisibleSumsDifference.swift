final class DivisibleandNondivisibleSumsDifference {
    func differenceOfSums(_ n: Int, _ m: Int) -> Int {
        func sum(_ n1: Int, _ n2: Int) -> Int {
            (n1 + n2) * (n2 - n1 + 1) / 2
        }
        var result = sum(1, n)
        let mCount = n / m
        guard mCount > 0 else { return result }
        result -= sum(1, mCount) * m * 2
        return result
    }
    
    func tests() {
        print(differenceOfSums(10, 3)) // 19
        print(differenceOfSums(5, 6)) // 15
        print(differenceOfSums(5, 1)) // -15
    }
}
