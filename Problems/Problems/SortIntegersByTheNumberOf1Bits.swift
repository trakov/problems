class SortIntegersByTheNumberOf1Bits {
    func sortByBits(_ arr: [Int]) -> [Int] {
        arr.sorted {
            if $0.nonzeroBitCount == $1.nonzeroBitCount {
                return $0 < $1
            } else {
                return $0.nonzeroBitCount < $1.nonzeroBitCount
            }
        }
    }

    func tests() {
        print(sortByBits([0,1,2,3,4,5,6,7,8])) // [0,1,2,4,8,3,5,6,7]
        print(sortByBits([1024,512,256,128,64,32,16,8,4,2,1])) // [1,2,4,8,16,32,64,128,256,512,1024]
    }
}
