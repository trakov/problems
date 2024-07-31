class FillingBookcaseShelves {
    func minHeightShelves(_ books: [[Int]], _ shelfWidth: Int) -> Int {
        let n = books.count
        var dp = Array(repeating: Int.max, count: n + 1)
        dp[0] = 0
        dp[1] = books[0][1]
        for i in 2...n {
            let book = books[i - 1]
            var remainingWidth = shelfWidth - book[0]
            var maxHeight = book[1]
            dp[i] = book[1] + dp[i - 1]
            var j = i - 1
            while j > 0 && remainingWidth - books[j - 1][0] >= 0 {
                maxHeight = max(maxHeight, books[j - 1][1])
                remainingWidth -= books[j - 1][0]
                dp[i] = min(dp[i], maxHeight + dp[j - 1])
                j -= 1
            }
        }
        return dp[n]
    }

    func minHeightShelves2(_ books: [[Int]], _ shelfWidth: Int) -> Int {
        var result = 0
        var (curW, curH) = (0, 0)
        for book in books {
            let (w, h) = (book[0], book[1])
            if w <= shelfWidth - curW {
                curW += w
                curH = max(curH, h)
            } else {
                result += curH
                (curW, curH) = (w, h)
            }
        }
        return result + curH
    }
    
    func tests() {
        print(minHeightShelves(
            [[1,1],[2,3],[2,3],[1,1],[1,1],[1,1],[1,2]], 4)) // 6
        print(minHeightShelves([[1,3],[2,4],[3,2]], 6)) // 4
    }
}

