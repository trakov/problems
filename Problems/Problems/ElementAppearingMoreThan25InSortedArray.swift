class ElementAppearingMoreThan25InSortedArray {
    func findSpecialInteger(_ arr: [Int]) -> Int {
        guard arr.count > 1 else { return arr[0] }
        let count = arr.count / 4 + 1
        var i = 0
        var prev = -1
        for num in arr {
            if num == prev {
                i += 1
                if i >= count { return num }
            } else {
                i = 1
                prev = num
            }
        }
        return -1
    }
    
    func tests() {
        print(findSpecialInteger([1,2,2,6,6,6,6,7,10])) // 6
        print(findSpecialInteger([1,1])) // 1
    }
}

