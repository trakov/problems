final class MinimumDistancetotheTargetElement {
    func getMinDistance(_ nums: [Int], _ target: Int, _ start: Int) -> Int {
        var d = Int.max
        for i in start..<nums.count where nums[i] == target {
            d = i - start
            break
        }
        for i in (0...start).reversed() where nums[i] == target {
            return min(d, start - i)
        }
        return d
    }
    
    func tests() {
        print(getMinDistance([1,2,3,4,5], 5, 3)) // 1
        print(getMinDistance([1], 1, 0)) // 0
        print(getMinDistance([1,1,1,1,1,1,1,1,1,1], 1, 0)) // 0
    }
}
