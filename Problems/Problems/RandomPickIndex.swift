class RandomPickIndex {
    private var map: [Int: [Int]] = [:]
    init(_ nums: [Int]) {
        for (i, num) in nums.enumerated() {
            map[num, default: []].append(i)
        }
    }
    
    func pick(_ target: Int) -> Int {
        guard let indices = map[target] else { return -1 }
        guard let index = indices.randomElement() else { return -1 }
        return index
    }

    func tests() {
        let r = RandomPickIndex([1, 2, 3, 3, 3])
        print(r.pick(3)) //
    }
}

