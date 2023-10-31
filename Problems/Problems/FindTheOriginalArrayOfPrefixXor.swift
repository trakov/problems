class FindTheOriginalArrayOfPrefixXor {
    func findArray(_ pref: [Int]) -> [Int] {
        let n = pref.count
        guard n > 1 else { return pref }
        var result = Array(repeating: 0, count: n)
        result[0] = pref[0]
        for i in 1..<n {
            result[i] = pref[i] ^ pref[i - 1]
        }
        return result
    }
    
    func tests() {
        print(findArray([5,2,0,3,1])) // [5,7,2,3,2]
        print(findArray([13])) // [13]
    }
}

