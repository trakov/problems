class DesignHashMap {
    var dict: [Int: Int] = [:]
    init() {
        
    }
    
    func put(_ key: Int, _ value: Int) {
        dict[key] = value
    }
    
    func get(_ key: Int) -> Int {
        dict[key] ?? -1
    }
    
    func remove(_ key: Int) {
        dict[key] = nil
    }

    func tests() {
//        print(<#name#>) //
    }
}

