class BoatsToSavePeople {
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        let people = people.sorted()
        var left = 0
        var right = people.count - 1
        var result = 0
        while left <= right {
            if people[right] + people[left] <= limit {
                left += 1
            }
            right -= 1
            result += 1
        }
        return result
    }
    
    func tests() {
        print(numRescueBoats([3,2,3,2,2], 6)) // 3
        print(numRescueBoats([1,2], 3)) // 1
        print(numRescueBoats([3,2,2,1], 3)) // 3
        print(numRescueBoats([3,5,3,4], 5)) // 4
    }
}

