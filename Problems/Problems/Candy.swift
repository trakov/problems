class Candy {
    func candy(_ ratings: [Int]) -> Int {
        let count = ratings.count
        guard count > 1 else { return count }
        var result = 0
        var ltr = Array(repeating: 1, count: count)
        var rtl = Array(repeating: 1, count: count)
        var i = 1
        while i < count {
            if ratings[i] > ratings[i - 1] {
                ltr[i] = ltr[i - 1] + 1
            }
            i += 1
        }
        i = count - 2
        while i >= 0 {
            if ratings[i] > ratings[i + 1] {
                rtl[i] = rtl[ i + 1] + 1
            }
            i -= 1
        }
        for i in 0..<count {
            result += max(ltr[i], rtl[i])
        }
        return result
    }
    
    func tests() {
        print(candy([1,0,2])) // 5
        print(candy([1,2,2])) // 4
    }
}

