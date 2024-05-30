class CountTripletsThatCanFormTwoArraysofEqualXOR {
    func countTriplets(_ arr: [Int]) -> Int {
        let n = arr.count
        var xor = 0
        var prefixes = [0] + arr
        for i in 0..<n {
            prefixes[i + 1] ^= prefixes[i]
        }
        var result = 0
        for end in 1...n {
            for start in 0..<end-1 {
                if prefixes[end] ^ prefixes[start] == 0 {
                    result += (end - start - 1)
                }
            }
        }
        return result
    }
    
    func tests() {
        print(countTriplets([2,3,1,6,7])) // 4
        print(countTriplets([1,1,1,1,1])) // 10
    }
}

