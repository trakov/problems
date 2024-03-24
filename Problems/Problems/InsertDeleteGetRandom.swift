class InsertDeleteGetRandom {
    class RandomizedSet {
        private var map: [Int: Int] = [:]
        private var array: [Int] = []
        init() {}

        func insert(_ val: Int) -> Bool {
            guard map[val] == nil else { return false }
            map[val] = array.count
            array.append(val)
            return true
        }

        func remove(_ val: Int) -> Bool {
            guard let index = map[val] else { return false }
            map[val] = nil
            if index == array.count - 1 {
                array.removeLast()
            } else {
                array[index] = array.removeLast()
                map[array[index]] = index
            }
            return true
        }

        func getRandom() -> Int {
            array.randomElement() ?? 0
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
        let set = RandomizedSet()
        print(set.insert(3))
        print(set.insert(3))
        print(set.getRandom())
        print(set.getRandom())
        print(set.insert(1))
        print(set.remove(3))
        print(set.getRandom())
        print(set.getRandom())
        print(set.insert(0))
        print(set.remove(0))
        
    }
}
