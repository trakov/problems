final class SmallestMissingMultipleofK {
    func missingMultiple(_ nums: [Int], _ k: Int) -> Int {
        let set = Set(nums)
        var result = k
        while set.contains(result) {
            result += k
        }
        return result
    }
    
    func tests() {
        print(missingMultiple([8,2,3,4,6], 2)) // 10
        print(missingMultiple([1,4,7,10,15], 5)) // 5
    }
}
