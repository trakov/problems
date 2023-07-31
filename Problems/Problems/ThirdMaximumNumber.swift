class ThirdMaximumNumber {
    func thirdMax(_ nums: [Int]) -> Int {
        guard Set(nums).count > 2 else { return nums.max()! }
        var m1 = Int.min
        var m2 = Int.min
        var m3 = Int.min
        
        for n in nums {
            if n > m1 {
                (m1, m2, m3) = (n, m1, m2)
            } else if n > m2 && n != m1 {
                (m2, m3) = (n, m2)
            } else if n > m3 && n != m2 && n != m1 {
                m3 = n
            }
        }
        
        return m3
    }

    func tests() {
        print(thirdMax([1,2,2,5,3,5])) // 2
        print(thirdMax([3,2,1])) // 1
        print(thirdMax([2,1])) // 2
        print(thirdMax([2,2,3,1])) // 1
    }
}
