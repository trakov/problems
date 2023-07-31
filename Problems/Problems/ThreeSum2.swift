class ThreeSum2 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 2 else { return [] }
        guard nums.count > 3 else { return nums.reduce(0, +) == 0 ? [nums] : [] }
        let nums = nums.sorted()
        guard nums[0] < 0 else { return nums.prefix(3).reduce(0, +) == 0 ? [[0,0,0]] : [] }
        var result: Set<[Int]> = []
        var i1 = 0
        var i2 = 1
        var left = i2 + 1
        var right = nums.count - 1
        while nums[i1] + nums[i2] <= 0 && left <= right {
            let sum2 = nums[i1] + nums[i2]
            if nums[right] == -sum2 {
                result.insert([nums[i1], nums[i2], nums[right]])
                i2 += 1
            } else if nums[right] > -sum2 {
                while left <= right {
                    let mid = (left + right) / 2
                    if nums[mid] == -sum2 {
                        result.insert([nums[i1], nums[i2], nums[mid]])
                        break
                    } else if nums[mid] < -sum2 {
                        left = mid + 1
                    } else {
                        right = mid - 1
                    }
                }
                i1 += 1
                i2 = i1 + 1
            } else {
                i2 += 1
            }
            left = i2 + 1
            right = nums.count - 1
        }
        return Array(result)
    }

    func tests() {
//        print(threeSum([1,-1,-1,0])) // [-1,0,1]
//        print(threeSum([-1,-1,-1,1])) // []
        print(threeSum([-1,0,1,2,-1,-4])) // [[-1,-1,2],[-1,0,1]]
//        print(threeSum([]))
//        print(threeSum([0]))
//        print(threeSum([0,0,0]))
//        print(threeSum([-2,0,1,1,2]))
//        print(threeSum([3,0,-2,-1,1,2])) // [[-2,-1,3],[-2,0,2],[-1,0,1]]
//        print(threeSum([-1,0,1,2,-1,-4])) // [[-1,-1,2],[-1,0,1]]
//        print(threeSum([-2,-1,1,1,3,0,-2,4]))
//        print(threeSum([-1,0,1,2,-1,-4,-2,-3,3,0,4])) // [[-4,0,4],[-4,1,3],[-3,-1,4],[-3,0,3],[-3,1,2],[-2,-1,3],[-2,0,2],[-1,-1,2],[-1,0,1]]
//        print(threeSum([-12,12,-5,-4,-12,11,9,-11,13,1,12,-1,8,1,-9,-11,-13,-4,10,-9,-6,-11,1,-15,-3,4,0,-15,3,6,-4,7,3,-2,10,-2,-6,4,2,-7,12,-1,7,6,7,6,2,10,-13,-3,8,-12,2,-5,-12,6,6,-5,6,-5,-14,9,9,-4,-8,4,2,-7,-15,-11,-7,12,-4,8,-5,-12,-1,12,5,1,-5,-1,5,12,9,0,3,0,3,-14,2,-4,2,-4,0,1,7,-13,9,-1,13,-12,-11,-6,11,-1,-10,-5,-3,10,3,7,-6,-15,-4,10,1,14,-12]))
    }
}
