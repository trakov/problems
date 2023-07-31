class SnapshotArray {
    private var array: [[(Int, Int)]] // snap_id, value
    private var curSnap = 0
    init(_ length: Int) {
        array = Array(repeating: [(Int, Int)](), count: length)
    }
    
    func set(_ index: Int, _ val: Int) {
        array[index].append((curSnap, val))
    }
    
    func snap() -> Int {
        curSnap += 1
        return curSnap - 1
    }
    
    func get(_ index: Int, _ snap_id: Int) -> Int {
        let values = array[index]
        var result = 0
        for (id, val) in values {
            guard id <= snap_id else { break }
            result = val
        }
        return result
    }
    
    func tests() {
//        print(<#name#>) //
    }
}

