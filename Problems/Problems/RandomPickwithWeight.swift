class RandomPickwithWeight {
    private let prefixes: [Int]
    private let sum: Int
    
    init(_ w: [Int]) {
        var sum = 0
        prefixes = w.map { num in
            sum += num
            return sum
        }
        self.sum = sum
    }
    
    func pickIndex() -> Int {
        let rand = Int.random(in: 1...sum)
        var l = 0
        var r = prefixes.count - 1
        while l < r {
            let mid = (l + r) / 2
            if prefixes[mid] == rand {
                l = mid
                break
            } else if prefixes[mid] < rand {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return l
    }

    func tests() {
        let r = RandomPickwithWeight([1,2,3,4,5])
        print(r.pickIndex()) //
        print(r.pickIndex()) //
        print(r.pickIndex()) //
        print(r.pickIndex()) //
        print(r.pickIndex()) //
        print(r.pickIndex()) //
        print(r.pickIndex()) //
        print(r.pickIndex()) //
        print(r.pickIndex()) //
        print(r.pickIndex()) //
    }
}

