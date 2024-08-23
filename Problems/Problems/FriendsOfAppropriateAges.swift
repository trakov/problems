class FriendsOfAppropriateAges {
    func numFriendRequests(_ ages: [Int]) -> Int {
        let MAX_AGE = 120
        var result = 0
        var count = Array(repeating: 0, count: MAX_AGE + 1)
        var notOlder = Array(repeating: 0, count: MAX_AGE + 1)
        for age in ages {
            count[age] += 1
        }
        for i in 1...MAX_AGE {
            notOlder[i] = count[i] + notOlder[i - 1]
        }
        for i in 15...MAX_AGE where count[i] > 0 {
            let c = notOlder[i] - notOlder[i / 2 + 7]
            result += c * count[i] - count[i]
        }
        return result
    }
    
    func tests() {
        print(numFriendRequests([16,16])) // 2
        print(numFriendRequests([16,17,18])) // 2
        print(numFriendRequests([20,30,100,110,120])) // 3
        print(numFriendRequests([101,56,69,48,30])) // 4
    }
}

