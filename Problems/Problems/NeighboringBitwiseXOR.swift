class NeighboringBitwiseXOR {
    func doesValidArrayExist(_ derived: [Int]) -> Bool {
        derived.reduce(0) { $0 ^ $1 } == 0
    }
    
    func tests() {
        print(doesValidArrayExist([1,0,0])) // true
        print(doesValidArrayExist([1,1])) // true
        print(doesValidArrayExist([1,0])) // false
    }
}
