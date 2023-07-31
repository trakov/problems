class InsertDeleteGetRandom {
    class RandomizedSet {
        private var mySet: Set<Int>
        
        init() {
            mySet = []
        }
        
        func insert(_ val: Int) -> Bool {
            mySet.insert(val).inserted
        }
        
        func remove(_ val: Int) -> Bool {
            mySet.remove(val) != nil
        }
        
        func getRandom() -> Int {
            mySet.randomElement() ?? 0
        }
    }

    /**
     * Your RandomizedSet object will be instantiated and called as such:
     * let obj = RandomizedSet()
     * let ret_1: Bool = obj.insert(val)
     * let ret_2: Bool = obj.remove(val)
     * let ret_3: Int = obj.getRandom()
     */
    func tests() {
        
    }
}
