class SmallestNumberInInfiniteSet {
    private var nums: [Int] = [] // desc sorted
    private var edge = 1
    init() { }
    
    func popSmallest() -> Int {
        if nums.last == nil {
            edge += 1
            return edge - 1
        } else {
            return nums.removeLast()
        }
    }
    
    func addBack(_ num: Int) {
        guard num < edge else { return }
        guard !nums.isEmpty else { return nums.append(num) }
        guard nums.first! != num && nums.last! != num else { return }
        if num > nums.first! { return nums.insert(num, at: 0) }
        if num < nums.last! { return nums.append(num) }
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (left + right) / 2
            if num < nums[mid] {
                left = mid + 1
            } else if num > nums[mid] {
                right = mid - 1
            } else {
                return
            }
        }
        nums.insert(num, at: left)
    }
    
    func tests() {
        addBack(2)
        print(popSmallest())
        print(popSmallest())
        print(popSmallest())
        addBack(1)
        print(popSmallest())
        print(popSmallest())
        print(popSmallest())
    }
}

