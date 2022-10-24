class RemoveElement {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        nums.removeAll { $0 == val }
        return nums.count
    }

    func tests() {
        var nums = [3,2,2,3]
        print(removeElement(&nums, 3))
        nums = [0,1,2,2,3,0,4,2]
        print(removeElement(&nums, 2))
    }
}
