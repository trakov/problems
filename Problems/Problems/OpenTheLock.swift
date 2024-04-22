class OpenTheLock {
    func openLock(_ deadends: [String], _ target: String) -> Int {
        guard target != "0000" else { return 0 }
        var count = 0
        var queue = [target]
        var visited: Set<String> = Set(deadends)
        while !queue.isEmpty {
            var nextQueue: [String] = []
            for q in queue {
                if q == "0000" {
                    return count
                }
                nextQueue.append(contentsOf: neighbours(of: q, visited: &visited))
            }
            count += 1
            queue = nextQueue
        }
        return -1
    }
    
    func neighbours(of item: String, visited: inout Set<String>) -> [String] {
        visited.insert(item)
        var result: [String] = []
        let q = Array(item)
        var temp: [Character] = []
        for (i,c) in q.enumerated() {
            temp = q
            let cur = Int(String(c))!
            for num in [(cur + 1) % 10, (cur + 9) % 10] {
                let next = Character(String(num))
                temp[i] = next
                if visited.insert(String(temp)).inserted {
                    result.append(String(temp))
                }
            }
        }
        return result
    }
    
    func tests() {
        print(openLock(["1131","1303","3113","0132","1301","1303","2200","0232","0020","2223"], "3312")) // 9
        print(openLock(["0201","0101","0102","1212","2002"], "0202")) // 6
        print(openLock(["8888"], "0009")) // 1
        print(openLock(["8887","8889","8878","8898","8788","8988","7888","9888"], "8888")) // -1
    }
}
