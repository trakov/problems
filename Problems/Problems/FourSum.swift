class FourSum {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count > 3 else { return [] }
        var result: [[Int]] = []
        let nums = nums.sorted()
        for i in 0 ..< nums.count-3 {
            guard i == 0 || nums[i] != nums[i-1] else { continue }
            let newTarget = target - nums[i]
            for j in i+1 ..< nums.count-2 {
                guard j == i+1 || nums[j] != nums[j-1] else { continue }
                var left = j+1
                var right = nums.count-1
                while left < right {
                    let sum = nums[j] + nums[left] + nums[right]
                    if sum > newTarget {
                        right -= 1
                    } else if sum < newTarget {
                        left += 1
                    } else {
                        result.append([nums[i], nums[j], nums[left], nums[right]])
                        while left < right && nums[left] == nums[left+1] { left += 1 }
                        while left < right && nums[right] == nums[right-1] { right -= 1 }
                        left += 1
                        right -= 1
                    }
                }
            }
        }
        return result
    }

    func fourSum2(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count > 3 else { return [] }
        let nums = nums.sorted()
        var result: Set<[Int]> = []
        
        func fill(a: Int, b: Int, d: Int) {
            var left = b + 1
            var right = d - 1
            let temp = nums[a] + nums[b] + nums[d]
            while left <= right {
                let mid = (left + right) / 2
                if temp + nums[mid] == target {
                    result.insert([nums[a], nums[b], nums[mid], nums[d]])
                    break
                } else if temp + nums[mid] > target {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
            if b < d - 2 {
                fill(a: a, b: b + 1, d: d)
            }
        }
        
        var a = 0, d = nums.count - 1
        
        while a < d - 2 {
            fill(a: a, b: a + 1, d: d)
            while a < d - 2 {
                fill(a: a, b: a + 1, d: d)
                d -= 1
            }
            d = nums.count - 1
            a += 1
        }
        return Array(result)
    }
    
    func tests() {
        print(fourSum([1,0,-1,0,-2,2], 0)) // [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
        print(fourSum([2,2,2,2,2], 8)) // [[2,2,2,2]]
    }
}
