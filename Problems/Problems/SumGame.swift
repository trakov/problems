final class SumGame {
    func sumGame(_ num: String) -> Bool {
        func get(_ arr: ArraySlice<Int>) -> (n: Int, q: Int) {
            var (n, q) = (0, 0)
            for num in arr {
                if num == -1 {
                    q += 1
                } else {
                    n += num
                }
            }
            return (n, q)
        }
        let n = num.count
        let num = num.map { Int(String($0)) ?? -1 }
        let left = get(num.prefix(n / 2))
        let right = get(num.suffix(n / 2))
        return (left.q + right.q) % 2 == 1 || left.n - right.n != ((right.q - left.q) * 9) / 2
    }

    func tests() {
        print(sumGame("5023")) // false
        print(sumGame("25??")) // true
        print(sumGame("?3295???")) // false
    }
}
