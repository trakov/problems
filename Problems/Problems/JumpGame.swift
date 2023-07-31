class JumpGame {
    func canJump(_ nums: [Int]) -> Bool {
        guard nums[0] < nums.count - 1 else { return true }
        guard nums[0] != 0 else { return false }
        var smallestJumpableIndex = nums.count - 1
        var i = nums.count - 2
        var jump = 0
        while i >= 0 {
            jump = nums[i]
            if jump + i >= smallestJumpableIndex {
                smallestJumpableIndex = i
            }
            i -= 1
        }
        return smallestJumpableIndex == 0
    }
    
    func tests() {
        print(canJump([2,3,1,1,4])) // true
        print(canJump([3,2,1,0,4])) // false
        print(canJump([8,2,4,4,4,9,5,2,5,8,8,0,8,6,9,1,1,6,3,5,1,2,6,6,0,4,8,6,0,3,2,8,7,6,5,1,7,0,3,4,8,3,5,9,0,4,0,1,0,5,9,2,0,7,0,2,1,0,8,2,5,1,2,3,9,7,4,7,0,0,1,8,5,6,7,5,1,9,9,3,5,0,7,5])) // true
    }
}
