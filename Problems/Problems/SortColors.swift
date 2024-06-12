class SortColors {
    // counting sort
    func sortColors(_ nums: inout [Int]) {
        var map: [Int: Int] = [:]
        for num in nums {
            map[num, default: 0] += 1
        }
        var i = 0
        for num in 0...2 {
            guard let count = map[num] else { continue }
            for j in i..<i + count {
                nums[j] = num
            }
            i += count
        }
    }

    func sortColors2(_ nums: inout [Int]) {
        guard nums.count > 1 else { return }
        var zero = 0
        var two = nums.count - 1
        var i = 0
        while i <= two {
            if nums[i] == 0 {
                nums.swapAt(zero, i)
                zero += 1
            } else if nums[i] == 2 {
                nums.swapAt(two, i)
                two -= 1
                i -= 1
            }
            i += 1
        }
    }
    
    func tests() {
        var nums = [2,0,2,1,1,0]
        sortColors(&nums)
        print(nums) // [0,0,1,1,2,2]
        
        nums = [2,0,1]
        sortColors(&nums)
        print(nums) // [0,1,2]
        
        nums = [0,0]
        sortColors(&nums)
        print(nums) // [0,0]
        
        nums = [0,1,0]
        sortColors(&nums)
        print(nums) // [0,0,1]
    }
}

