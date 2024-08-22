class MissingRanges {
    func findMissingRanges(_ nums: [Int], _ lower: Int, _ upper: Int) -> [[Int]] {
        var result: [[Int]] = []
        var lower = lower
        for num in nums {
            if lower < num {
                result.append([lower, num - 1])
            }
            lower = num + 1
        }
        if lower <= upper {
            result.append([lower, upper])
        }
        return result
    }
    
    func tests() {
        print(findMissingRanges([0,1,3,50,75], 0, 99)) // [[2,2],[4,49],[51,74],[76,99]]
        print(findMissingRanges([-1], -1, -1)) // []
    }
}

