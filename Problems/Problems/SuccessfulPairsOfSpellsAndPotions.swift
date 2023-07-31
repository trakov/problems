class SuccessfulPairsOfSpellsAndPotions {
    func successfulPairs(_ spells: [Int], _ potions: [Int], _ success: Int) -> [Int] {
        let potions = potions.sorted()
        var result = Array(repeating: 0, count: spells.count)
        var left = 0
        var right = potions.count - 1
        
        for (i, spell) in spells.enumerated() {
            guard spell * potions.last! >= success else { result[i] = 0; continue }
            while left <= right {
                let mid = (left + right) / 2
                let val = spell * potions[mid]
                if val < success {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
            result[i] = potions.count - left
            left = 0
            right = potions.count - 1
        }
        
        return result
    }
    
    func tests() {
        print(successfulPairs([2,3,4], [1,1,8,8,8,8,8,8,8], 16)) // [7,7,7]

//        print(successfulPairs([1,2,3,4,5,6,7], [1,2,3,4,5,6,7], 25)) // [0,0,0,1,3,3,4]
//        print(successfulPairs([5,1,3], [1,2,3,4,5], 7)) // [4,0,3]
//        print(successfulPairs([3,1,2], [8,5,8], 16)) // [2,0,2]
    }
}

