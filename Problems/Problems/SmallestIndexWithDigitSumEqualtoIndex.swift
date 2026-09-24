final class SmallestIndexWithDigitSumEqualtoIndex {
    func smallestIndex(_ nums: [Int]) -> Int {
        nums.enumerated().first { (i, num) in
            i == String(num).reduce(0, {
                $0 + $1.wholeNumberValue!
            })
        }?.offset ?? -1
    }
    
    func tests() {
        print(smallestIndex([1,3,2])) // 2
        print(smallestIndex([1,10,11])) // 1
        print(smallestIndex([1,2,3])) // -1
    }
}
