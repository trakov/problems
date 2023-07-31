import Foundation
class Combinations {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var temp: [Int] = []
        var answer: [[Int]] = []
        backtrack(1, &temp, &answer, n, k)
        return answer
    }
    
    func backtrack(_ idx: Int, _ path: inout [Int], _ result: inout [[Int]], _ n: Int, _ k: Int) {
        if path.count == k {
            result.append(path)
            return
        }
        
        for i in idx..<n+1 {
            path.append(i)
            backtrack(i+1, &path, &result, n, k)
            path.removeLast()
        }
    }

    func tests() {
        print(combine(4, 2)) // [[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]
        print(combine(1, 1)) // [[1]]
    }
}
