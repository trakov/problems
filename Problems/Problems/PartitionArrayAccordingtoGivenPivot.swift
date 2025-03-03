class PartitionArrayAccordingtoGivenPivot {
    func pivotArray(_ nums: [Int], _ pivot: Int) -> [Int] {
        guard nums.count > 1 else { return nums }
        var left: [Int] = []
        var middle: [Int] = []
        var right: [Int] = []
        for num in nums {
            if num < pivot {
                left.append(num)
            } else if num == pivot {
                middle.append(num)
            } else {
                right.append(num)
            }
        }
        return left + middle + right
    }
    
    func tests() {
        print(pivotArray([9,12,5,10,14,3,10], 10)) // [9,5,3,10,10,12,14]
        print(pivotArray([-3,4,3,2], 2)) // [-3,2,4,3]
    }
}

