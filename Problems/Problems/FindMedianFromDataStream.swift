class FindMedianFromDataStream {
    private var nums: [Int] = []
    
    init() {
        
    }
    
    func addNum(_ num: Int) {
        guard !nums.isEmpty else { nums.append(num); return }
        var left = 0
        var right = nums.count - 1
        while left != right {
            let med = (right + left) / 2
            if num > nums[med] {
                left = med + 1
            } else {
                right = med
            }
        }
        if num > nums[left] {
            nums.append(num)
        } else {
            nums.insert(num, at: left)
        }
    }
    
    func findMedian() -> Double {
        guard !nums.isEmpty else { return 0.0 }
        let halfIndex = nums.count / 2
        return nums.count % 2 != 0
        ? Double(nums[halfIndex])
        : Double(nums[halfIndex] + nums[halfIndex - 1]) / 2.0
    }

    func tests() {
        print(findMedian()) // 0.0
        addNum(1)
        print(findMedian()) // 1.0
        addNum(2)
        print(findMedian()) // 1.5
        addNum(3)
        print(findMedian()) // 2.0
        addNum(4)
        print(findMedian()) // 2.5
        addNum(5)
        print(findMedian()) // 3.0
        addNum(0)
        print(findMedian()) // 2.5
        addNum(0)
        print(findMedian()) // 2.0
    }
}
