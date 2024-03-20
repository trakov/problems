class MergeInBetweenLinkedLists {
    func mergeInBetween(_ list1: ListNode?, _ a: Int, _ b: Int, _ list2: ListNode?) -> ListNode? {
        var i = 0
        var node = list1
        while i < a - 1 {
            node = node?.next
            i += 1
        }
        let subTail = node
        while i <= b {
            node = node?.next
            i += 1
        }
        let subHead = node
        node = list2
        while node?.next != nil {
            node = node?.next
        }
        subTail?.next = list2
        node?.next = subHead
        return list1
    }
    
    func tests() {
        print(mergeInBetween(
            [0,1,2,3,4,5], 2, 4, [10,11,12]
        )) // [0,1,10,11,12,5]
        print(mergeInBetween(
            [10,1,13,6,9,5], 3, 4, [1000000,1000001,1000002]
        )) // [10,1,13,1000000,1000001,1000002,5]
        print(mergeInBetween(
            [0,1,2,3,4,5,6], 2, 5, [1000000,1000001,1000002,1000003,1000004]
        )) // [0,1,1000000,1000001,1000002,1000003,1000004,6]
    }
}

