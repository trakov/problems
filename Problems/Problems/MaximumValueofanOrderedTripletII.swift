class MaximumValueofanOrderedTripletII {
    func maximumTripletValue(_ nums: [Int]) -> Int {
        var a = Int.min
        var diff = Int.min
        var result = Int.min
        for num in nums {
            if diff != Int.min {
                result = max(result, diff * num)
            }
            if a == Int.min {
                a = num
            } else {
                a = max(a, num)
                diff = max(diff, a - num)
            }
        }
        return max(result, 0)
    }
    
    func tests() {
        print(maximumTripletValue([12,6,1,2,7])) // 77
        print(maximumTripletValue([1,10,3,4,19])) // 133
        print(maximumTripletValue([1,2,3])) // 0
    }
}
