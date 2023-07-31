class DesignDoublyLinkedList {
    private class Node {
        var val: Int
        var next: Node?
        var prev: Node?
        
        init(val: Int, next: Node? = nil, prev: Node? = nil) {
            self.val = val
            self.next = next
            self.prev = prev
        }
    }
    
    private var head: Node?
    private var tail: Node?
    private var count = 0
    
    init() {}
//    int get(int index) Get the value of the indexth node in the linked list. If the index is invalid, return -1.
    func get(_ index: Int) -> Int {
        let index = max(0, index)
        guard index < count else { return -1 }
        if index == count - 1 { return tail!.val }
        return node(by: index).val
    }
    
//    void addAtHead(int val) Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
    func addAtHead(_ val: Int) {
        let node = Node(val: val, next: head)
        if head == nil {
            tail = node
        }
        head?.prev = node
        head = node
        count += 1
    }
    
//    void addAtTail(int val) Append a node of value val as the last element of the linked list.
    func addAtTail(_ val: Int) {
        if head == nil { return addAtHead(val) }
        tail?.next = Node(val: val, prev: tail)
        tail = tail?.next
        count += 1
    }
    
//    void addAtIndex(int index, int val) Add a node of value val before the indexth node in the linked list. If index equals the length of the linked list, the node will be appended to the end of the linked list. If index is greater than the length, the node will not be inserted.
    func addAtIndex(_ index: Int, _ val: Int) {
        guard index <= count else { return }
        let index = max(index, 0)
        if index == 0 { return addAtHead(val) }
        if index == count { return addAtTail(val) }
        let prev = node(by: index).prev
        prev?.next = Node(val: val, next: prev?.next, prev: prev)
        prev?.next?.next?.prev = prev?.next
        count += 1
    }
    
//    void deleteAtIndex(int index) Delete the indexth node in the linked list, if the index is valid.
    func deleteAtIndex(_ index: Int) {
        guard count > 0 else { return }
        guard index >= 0 && index < count else { return }
        if index == 0 {
            head = head?.next
            head?.prev = nil
            if head == nil {
                tail = nil
            }
        } else {
            let prev = node(by: index).prev
            prev?.next = prev?.next?.next
            prev?.next?.prev = prev
            if prev?.next == nil {
                tail = prev
            }
        }
        count -= 1
    }
    
    private func node(by index: Int) -> Node {
        if index < count/2 {
            var node = head
            var i = 0
            while i < index {
                node = node?.next
                i += 1
            }
            return node!
        } else {
            var node = tail
            var i = count - 1
            while i > index {
                node = node?.prev
                i -= 1
            }
            return node!
        }
    }
    
    func tests() {
        addAtHead(1)
        addAtTail(3)
        addAtIndex(1, 2)
        let a = get(1)
        deleteAtIndex(1)
        let b = get(1)
    }
}
