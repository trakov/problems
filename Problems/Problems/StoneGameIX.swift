final class StoneGameIX {
    func stoneGameIX(_ stones: [Int]) -> Bool {
        var (c0, c1, c2) = (0, 0, 0)
        for stone in stones {
            let type = stone % 3
            if type == 0 {
                c0 += 1
            } else if type == 1 {
                c1 += 1
            } else {
                c2 += 1
            }
        }
        if c0 % 2 == 0 {
            return c1 >= 1 && c2 >= 1
        }
        return c1 - c2 > 2 || c2 - c1 > 2
    }
    
    func tests() {
        print(stoneGameIX([2,1])) // true
        print(stoneGameIX([2])) // false
        print(stoneGameIX([5,1,2,4,3])) // false
    }
}
