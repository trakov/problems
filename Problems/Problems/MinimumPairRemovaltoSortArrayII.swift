import Collections
final class MinimumPairRemovaltoSortArrayII {
    struct PQItem: Comparable {
        var first: Node?
        var second: Node?
        var cost: Int
        init(_ first: Node? = nil, _ second: Node? = nil, _ cost: Int) {
            self.first = first
            self.second = second
            self.cost = cost
        }
        static func == (lhs: PQItem, rhs: PQItem) -> Bool {
            if lhs.cost != rhs.cost { return false }
            return lhs.first?.left == rhs.first?.left
        }
        static func < (lhs: PQItem, rhs: PQItem) -> Bool {
            if lhs.cost == rhs.cost {
                return lhs.first!.left < rhs.first!.left
            }
            return lhs.cost < rhs.cost
        }
    }

    class Node {
        var value: Int
        var left: Int
        var prev: Node?
        var next: Node?

        init(_ value: Int, _ left: Int) {
            self.value = value
            self.left = left
        }
    }

    func minimumPairRemoval(_ nums: [Int]) -> Int {
        var pq = Collections.Heap<PQItem>()
        var merged = Array(repeating: false, count: nums.count)
        var decreaseCount = 0
        var count = 0
        let head = Node(nums[0], 0)
        var current = head
        for i in 1..<nums.count {
            let newNode = Node(nums[i], i)
            current.next = newNode
            newNode.prev = current
            pq.insert(PQItem(current, newNode, current.value + newNode.value))
            if nums[i - 1] > nums[i] {
                decreaseCount += 1
            }
            current = newNode
        }
        while decreaseCount > 0 {
            let item = pq.removeMin()
            let first = item.first!
            let second = item.second!
            let cost = item.cost
            if merged[first.left] ||
                merged[second.left] ||
                first.value + second.value != cost {
                continue
            }
            count += 1
            if first.value > second.value {
                decreaseCount -= 1
            }
            let prevNode = first.prev
            let nextNode = second.next
            first.next = nextNode
            if nextNode != nil {
                nextNode?.prev = first
            }
            if let prevNode {
                if prevNode.value > first.value && prevNode.value <= cost {
                    decreaseCount -= 1
                } else if prevNode.value <= first.value && prevNode.value > cost {
                    decreaseCount += 1
                }
                pq.insert(PQItem(prevNode, first, prevNode.value + cost))
            }
            if let nextNode {
                if second.value > nextNode.value && cost <= nextNode.value {
                    decreaseCount -= 1
                } else if second.value <= nextNode.value && cost > nextNode.value {
                    decreaseCount += 1
                }
                pq.insert(PQItem(first, nextNode, cost + nextNode.value))
            }
            first.value = cost
            merged[second.left] = true
        }
        return count
    }
    
    func tests() {
        print(minimumPairRemoval([5,2,3,1])) // 2
        print(minimumPairRemoval([1,2,2])) // 0
    }
}

