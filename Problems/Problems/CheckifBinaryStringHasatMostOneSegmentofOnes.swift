final class CheckifBinaryStringHasatMostOneSegmentofOnes {
    func checkOnesSegment(_ s: String) -> Bool {
        var foundZero = false
        for c in s {
            if c == "0" {
                foundZero = true
            } else if foundZero {
                return false
            }
        }
        return true
    }
    
    func tests() {
        print(checkOnesSegment("1001")) // false
        print(checkOnesSegment("110")) // true
    }
}
