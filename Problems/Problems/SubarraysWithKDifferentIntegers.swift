class SubarraysWithKDifferentIntegers {
    func subarraysWithKDistinct(_ nums: [Int], _ k: Int) -> Int {
        var map: [Int: Int] = [:]
        var result = 0
        var left = 0
        var right = 0
        func minusOne(_ num: Int) {
            map[num] = (map[num] == 1) ? nil : map[num]! - 1
        }
        func plusOne(_ num: Int) {
            map[num, default: 0] += 1
        }
        while right < nums.count {
            let num = nums[right]
            plusOne(num)
            guard map.count >= k else { right += 1; continue }
            guard map.count > k else {
                right += 1
                for i in left..<right {
                    result += 1
                    minusOne(nums[i])
                    guard map.count < k else { continue }
                    for j in left...i {
                        plusOne(nums[j])
                    }
                    break
                }
                continue
            }
            while map.count > k {
                minusOne(nums[left])
                left += 1
            }
            minusOne(num)
        }
        return result
    }
    
    func tests() {
        print(subarraysWithKDistinct([1,2,1,2,3], 2)) // 7
        print(subarraysWithKDistinct([1,2,1,3,4], 3)) // 3
        print(subarraysWithKDistinct([1,2,1,2], 2)) // 6
        print(subarraysWithKDistinct([1,1,1,1], 1)) // 10
        print(subarraysWithKDistinct([1,2], 1)) // 2
    }
}

