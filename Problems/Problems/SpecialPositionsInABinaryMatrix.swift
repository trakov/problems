class SpecialPositionsInABinaryMatrix {
    func numSpecial(_ mat: [[Int]]) -> Int {
        var candidates: Set<Int> = []
        var rejected: Set<Int> = []
        for row in mat {
            let ones = Set<Int>(row.enumerated().compactMap {
                guard $0.element == 1 else { return nil }
                return $0.offset
            })
            if ones.count == 1, let num = ones.first {
                if !candidates.insert(num).inserted {
                    rejected.insert(num)
                }
            } else {
                rejected.formUnion(ones)
            }
        }
        return candidates.subtracting(rejected).count
    }
    
    func tests() {
        print(numSpecial([[1,0,0],[0,0,1],[1,0,0]])) // 1
        print(numSpecial([[1,0,0],[1,0,0],[1,0,0]])) // 0
        print(numSpecial([[1,0,0],[0,1,0],[0,0,1]])) // 3
    }
}

