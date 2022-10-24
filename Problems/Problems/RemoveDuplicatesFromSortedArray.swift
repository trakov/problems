class RemoveDuplicatesFromSortedArray {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var i = 0
        for j in 1..<nums.count {
            if nums[i] != nums[j] {
                nums[i + 1] = nums[j]
                i += 1
            }
        }
        return i + 1
    }
    
    func tests() {
        var nums = [1,1,2]
        print(removeDuplicates(&nums), nums) // 2, nums = [1,2,_]
        nums = [0,0,1,1,1,2,2,3,3,4]
        print(removeDuplicates(&nums), nums) // 5, nums = [0,1,2,3,4,_,_,_,_,_]
    }
}
