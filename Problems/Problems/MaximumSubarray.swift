class MaximumSubarray {
    func maxSubArray(_ nums: [Int]) -> Int {
        var sums = [Int]()
//        var result = 0
//        var candidate = 0
//        for num in nums {
//            if num > 0 {
//                if firstPos == 0 {
//                    firstPos = num
//                } else {
//                    secondPos = num
//                }
//                pos += num
//                if neg < 0 {
//                    sums.append(neg)
//                    neg = 0
//                }
//            } else {
//                neg += num
//                if pos > 0 {
//                    sums.append(pos)
//                    pos = 0
//                }
//            }
//        }
//        var temp = 0
//        var index = 0
//        while index < sums.count {
//            if sums[index] > 0 {
//                if temp >= 0 {
//                    temp += sums[index]
//                } else {
//                    
//                }
//            }
//            
//            
//        }
        return sums.max()!
    }

    func tests() {
        print(maxSubArray([-2,1,-3,4,-1,2,1,-5,4])) // 6
        print(maxSubArray([1])) // 1
        print(maxSubArray([5,4,-1,7,8])) // 23
    }
}
