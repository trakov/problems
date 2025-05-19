final class TypeofTriangle {
    func triangleType(_ nums: [Int]) -> String {
        let nums = nums.sorted()
        let (a, b, c) = (nums[0], nums[1], nums[2])
        guard a + b > c else { return "none" }
        if a == b && b == c { return "equilateral" }
        if a == b || b == c { return "isosceles" }
        return "scalene"
    }
    
    func tests() {
        print(triangleType([3,3,3])) // "equilateral"
        print(triangleType([3,4,5])) // "scalene"
    }
}
