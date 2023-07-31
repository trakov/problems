import Foundation

class PerfectSquares {
    func numSquares(_ n: Int) -> Int {
        bfs(n)
    }
    
    func dpSolution(_ n: Int) -> Int {
        var dp = Array(0...n)
        for i in 1...n {
            var j = 1
            
            while j * j <= i {
                dp[i] = min(dp[i], dp[i - j * j] + 1)
                j += 1
            }
        }
        return dp[n]
    }
    
    func bfs(_ n: Int) -> Int {
        let squares: [Int] = (0...Int(sqrt(Double(n)))).reversed().map {
            $0 * $0
        }
        var queue: [[Int]] = squares.map { [$0, 1] } // sums:count
        var visited: Set<Int> = [] // sums

        while !queue.isEmpty {
            let sumCount = queue.removeFirst()
            if sumCount[0] == n {
                return sumCount[1]
            }

            for square in squares {
                let sum = sumCount[0] + square
                if sum <= n && !visited.contains(sum) {
                    queue.append([sum, sumCount[1] + 1])
                    visited.insert(sum)
                }
            }
        }

        return n
    }

    func tests() {
        print("43", numSquares(43)) // 3 : 4 + 4 + 4
        print("12", numSquares(12)) // 3 : 4 + 4 + 4
        print("13", numSquares(13)) // 2 : 4 + 9
        print("24", numSquares(24)) // 3 : 16 + 4 + 4
        print("21", numSquares(21)) // 3 : 16 + 4 + 1
    }
}
