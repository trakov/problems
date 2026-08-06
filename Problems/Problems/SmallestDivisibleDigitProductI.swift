final class SmallestDivisibleDigitProductI {
    func smallestNumber(_ n: Int, _ t: Int) -> Int {
        func product(_ num: Int) -> Int {
            String(num).compactMap(\.wholeNumberValue).reduce(1, *)
        }
        for num in n...n+10 {
            guard product(num) % t == 0 else { continue }
            return num
        }
        return -1
    }
    
    func tests() {
        print(smallestNumber(10, 2)) // 10
        print(smallestNumber(15, 3)) // 16
    }
}
