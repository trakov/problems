class FindTheWinnerOfTheCircularGame {
    func findTheWinner(_ n: Int, _ k: Int) -> Int {
        guard n > 1 else { return 1 }
        let head: ListNode? = ListNode(1)
        var node = head
        for i in 2...n {
            let next = ListNode(i)
            node?.next = next
            node = next
        }
        node?.next = head
        while node?.next !== node {
            for _ in 0..<k-1 {
                node = node?.next
            }
            node?.next = node?.next?.next
        }
        return node!.val
    }

    func findTheWinner1(_ n: Int, _ k: Int) -> Int {
        var result = Array(1...n)
        var i = k - 1
        while result.count > 1 {
            result.remove(at: i)
            i = (i + k - 1) % result.count
        }
        return result[0]
    }

    func findTheWinner2(_ n: Int, _ k: Int) -> Int {
        var result = (1...n).reduce(into: 0) { $0 ^= $1 }
        var i = k
        var n = n
        while result ^ i != 0 {
            result ^= i
            n -= 1
            i = (i + k) % n + 1
        }
        return result
    }
    
    func tests() {
        print(findTheWinner(5, 2)) // 3
        print(findTheWinner(6, 5)) // 1
    }
}

