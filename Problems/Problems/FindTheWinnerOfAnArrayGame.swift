class FindTheWinnerOfAnArrayGame {
    func getWinner(_ arr: [Int], _ k: Int) -> Int {
        var result = arr[0]
        var round = 0
        for i in 1..<arr.count {
            if result < arr[i] {
                result = arr[i]
                round = 0
            }
            round += 1
            if round == k {
                break
            }
        }
        return result
    }
    
    func tests() {
        print(getWinner([2,1,3,5,4,6,7], 2)) // 5
        print(getWinner([3,2,1], 10)) // 3
    }
}

