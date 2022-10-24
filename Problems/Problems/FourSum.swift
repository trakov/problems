class FourSum {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        return [[0]]
    }
    
    func tests() {
        print(fourSum([1,0,-1,0,-2,2], 0)) // [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]]
        print(fourSum([2,2,2,2,2], 8)) // [[2,2,2,2]]
    }
}
