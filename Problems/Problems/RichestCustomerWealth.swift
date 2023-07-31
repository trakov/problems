class RichestCustomerWealth {
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        var maxSum = 0
        for account in accounts {
            let sum = account.reduce(0) { $0 + $1 }
            maxSum = max(maxSum, sum)
        }
        return maxSum
    }
    
    func tests() {
        print(maximumWealth([[1,2,3],[3,2,1]])) // 6
        print(maximumWealth([[1,5],[7,3],[3,5]])) // 10
        print(maximumWealth([[2,8,7],[7,1,3],[1,9,5]])) // 17
    }
}
