class MaximumNumberOfCoinsYouCanGet {
    func maxCoins(_ piles: [Int]) -> Int {
        let piles = piles.sorted(by: >)
        var result = 0
        for i in 0..<piles.count/3 {
            result += piles[2 * i + 1]
        }
        return result
    }
    
    func tests() {
        print(maxCoins([2,4,1,2,7,8])) // 9
        print(maxCoins([2,4,5])) // 4
        print(maxCoins([9,8,7,6,5,1,2,3,4])) // 18
    }
}

