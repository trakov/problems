class MaximizeHappinessofSelectedChildren {
    func maximumHappinessSum(_ happiness: [Int], _ k: Int) -> Int {
        let sorted = happiness.sorted(by: >)
        var result = 0
        for i in 0..<k {
            result += max(sorted[i] - i, 0)
        }
        return result
    }
    
    func tests() {
        print(maximumHappinessSum([1,2,3], 2)) // 4
        print(maximumHappinessSum([1,1,1,1], 2)) // 1
        print(maximumHappinessSum([2,3,4,5], 1)) // 5
    }
}

