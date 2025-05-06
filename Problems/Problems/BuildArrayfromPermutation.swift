final class BuildArrayfromPermutation {
    func buildArray(_ nums: [Int]) -> [Int] {
        nums.map { nums[$0] }
    }
    
    func tests() {
        print(buildArray([0,2,1,5,3,4])) // [0,1,2,4,5,3]
        print(buildArray([5,0,1,2,3,4])) // [4,5,0,1,2,3]
    }
}
