class SplitLinkedListInParts {
    func splitListToParts(_ head: ListNode?, _ k: Int) -> [ListNode?] {
        guard k > 1 else { return [head] }
        var count = 0
        var node = head
        while node != nil {
            count += 1
            node = node?.next
        }
        var rem = count % k
        let size = count / k
        var result: [ListNode?] = Array(repeating: nil, count: k)
        node = head
        for i in 0..<k {
            count = size + (rem > 0 ? 1 : 0)
            guard count > 0 else { break }
            var n = node
            while count > 1 {
                n = n?.next
                count -= 1
            }
            result[i] = node
            node = n?.next
            n?.next = nil
            rem -= 1
        }
        return result
    }
    
    func tests() {
        var head: ListNode = [1,2,3]
        print(splitListToParts(head, 5)) // [[1],[2],[3],[],[]]
        
        head = [1,2,3,4,5,6,7,8,9,10]
        print(splitListToParts(head, 3)) // [[1,2,3,4],[5,6,7],[8,9,10]]
    }
}

