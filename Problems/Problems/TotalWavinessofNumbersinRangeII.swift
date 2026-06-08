final class TotalWavinessofNumbersinRangeII {
    func totalWaviness(_ num1: Int, _ num2: Int) -> Int {
        func solve(_ num: Int) -> Int {
            guard num > 0 else { return 0 }
            let digits: [Int] = {
                var res: [Int] = []
                var num = num
                while num > 0 {
                    res.append(num % 10)
                    num /= 10
                }
                return res.reversed()
            }()
            var memo: [Int: (count: Int, sum: Int)] = [:]

            func key(_ pos: Int, _ second: Int, _ last: Int) -> Int {
                (pos * 11 + second) * 11 + last
            }

            func dfs(_ pos: Int, _ tight: Bool, _ started: Bool, _ second: Int, _ last: Int) -> (count: Int, sum: Int) {
                guard pos < digits.count else { return (1, 0) }

                let k = key(pos, second, last)
                if !tight, let cached = memo[k] {
                    return cached
                }

                let limit = tight ? digits[pos] : 9
                var totalCount = 0
                var totalSum = 0
                for d in 0...limit {
                    let nextTight = tight && d == limit
                    if !started && d == 0 {
                        let child = dfs(pos + 1, nextTight, false, -1, -1)
                        totalCount += child.count
                        totalSum += child.sum
                        continue
                    }

                    var extra = 0
                    var nextSecond: Int
                    var nextLast: Int
                    if !started {
                        nextSecond = -1
                        nextLast = d
                    } else if second == -1 {
                        nextSecond = last
                        nextLast = d
                    } else {
                        if (second < last && last > d) || (second > last && last < d) {
                            extra = 1
                        }
                        nextSecond = last
                        nextLast = d
                    }

                    let child = dfs(pos + 1, nextTight, true, nextSecond, nextLast)
                    totalCount += child.count
                    totalSum += child.sum + child.count * extra
                }
                memo[k] = (totalCount, totalSum)
                return (totalCount, totalSum)
            }
            return dfs(0, true, false, -1, -1).sum
        }
        return solve(num2) - solve(num1 - 1)
    }
    
    func tests() {
        print(totalWaviness(120, 130)) // 3
        print(totalWaviness(198, 202)) // 3
        print(totalWaviness(4848, 4848)) // 2
    }
}
