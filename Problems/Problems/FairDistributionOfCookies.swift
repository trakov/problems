class FairDistributionOfCookies {
    
    func distributeCookies2(_ cookies: [Int], _ k: Int) -> Int {
        let cookies = cookies.sorted()
        guard cookies.count > k else { return cookies.last! }
        let sum = cookies.reduce(0, +)
        
        let average = Double(sum) / Double(k)
        print(average)
        return 0
    }
    
    func distributeCookies(_ cookies: [Int], _ k: Int) -> Int {
        let n = cookies.count
        var kids = Array(repeating: 0, count: k)
        var result = Int.max
        func dfs(_ i: Int) {
            if i == n {
                result = min(result, kids.max()!)
                return
            }
            for j in 0..<k {
                kids[j] += cookies[i]
                dfs(i + 1)
                kids[j] -= cookies[i]
            }
        }
        dfs(0)
        return result
    }
    
    func tests() {
        print(distributeCookies([8,15,10,20,8], 2)) // 31
        print(distributeCookies([6,1,3,2,2,4,1,2], 3)) // 7
    }
}

