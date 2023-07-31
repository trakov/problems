class OpenTheLock {
    func openLock(_ deadends: [String], _ target: String) -> Int {
        guard target != "0000" else { return 0 }
        guard !deadends.contains("0000") else { return -1 }
        var target = target
        var count = 0
        var queue = [target]
        var visited: Set<String> = Set(deadends)
        while !queue.isEmpty {
            let size = queue.count
            for i in 0..<size {
                if queue[i] == "0000" {
                    return count
                }
                queue.append(contentsOf: neighbours(of: queue[i], visited: &visited))
            }
            count += 1
            queue.removeFirst(size)
        }
        
        return -1
    }
    
    func neighbours(of item: String, visited: inout Set<String>) -> [String] {
        visited.insert(item)
        var result: [String] = []
        let q = Array(item)
        var temp: [Character] = []
        var next: Character = "-"
        for (i,c) in q.enumerated() {
            temp = q
            var num = (Int(String(c))! + 1) % 10
            next = Character(String(num))
            temp[i] = next
            if !visited.contains(String(temp)) {
                result.append(String(temp))
                visited.insert(String(temp))
            }
            num = (10 + Int(String(c))! - 1) % 10
            next = Character(String(num))
            temp[i] = next
            if !visited.contains(String(temp)) {
                result.append(String(temp))
                visited.insert(String(temp))
            }
        }
        
        return result
    }
    
    func tests() {
        print(openLock(["1131","1303","3113","0132","1301","1303","2200","0232","0020","2223"], "3312"))
//        print(openLock(["0201","0101","0102","1212","2002"], "0202")) // 6
//        print(openLock(["8888"], "0009")) // 1
//        print(openLock(["8887","8889","8878","8898","8788","8988","7888","9888"], "8888")) // -1
    }
}
