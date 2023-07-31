class FindTheDuplicateNumber {
    func findDuplicate(_ nums: [Int]) -> Int {
        var tortoise = nums[0]
        var hare = nums[0]
        repeat {
            tortoise = nums[tortoise]
            hare = nums[nums[hare]]
        } while tortoise != hare
        
        tortoise = nums[0]
        while tortoise != hare {
            tortoise = nums[tortoise]
            hare = nums[hare]
        }
        return hare
    }
    
    func tests() {
        print(findDuplicate([1,3,4,2,2])) // 2
        print(findDuplicate([3,1,3,4,2])) // 3
    }
}

