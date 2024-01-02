class ConvertAnArrayIntoA2DArrayWithConditions {
    func findMatrix(_ nums: [Int]) -> [[Int]] {
        var map: [Int: Int] = [:]
        var result: [[Int]] = [[]]
        for num in nums {
            if let count = map[num] {
                if count >= result.count {
                    result.append([])
                }
                result[count].append(num)
                map[num] = count + 1
            } else {
                map[num] = 1
                result[0].append(num)
            }
        }
        return result
    }
    
    func tests() {
        print(findMatrix([1,3,4,1,2,3,1])) // [[1,3,4,2],[1,3],[1]]
        print(findMatrix([1,2,3,4])) // [[4,3,2,1]]
    }
}

