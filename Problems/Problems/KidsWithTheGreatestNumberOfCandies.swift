class KidsWithTheGreatestNumberOfCandies {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        var result = Array(repeating: true, count: candies.count)
        let maxValue = candies.max()!
        for (i, candy) in candies.enumerated() {
            result[i] = (candy + extraCandies >= maxValue)
        }
        return result
    }
    
    func tests() {
        print(kidsWithCandies([2,3,5,1,3], 3)) // [true,true,true,false,true]
        print(kidsWithCandies([4,2,1,1,2], 1)) // [true,false,false,false,false]
        print(kidsWithCandies([12,1,12], 10)) // [true,false,true]
    }
}

