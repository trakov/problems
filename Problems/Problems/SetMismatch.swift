class SetMismatch {
    func findErrorNums2(_ nums: [Int]) -> [Int] {
        var set: Set<Int> = []
        var result: [Int] = []
        for num in nums {
            if !set.insert(num).inserted {
                result.append(num)
            }
        }
        for i in 1...nums.count where !set.contains(i) {
            result.append(i)
            break
        }
        return result
    }
    
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var all = Array(repeating: 0, count: nums.count + 1)
        var result: [Int] = []
        for num in nums {
            if all[num] != 0 {
                result.append(num)
            }
            all[num] = num
        }
        for (i, num) in all.enumerated().dropFirst() where num == 0 {
            result.append(i)
            break
        }
        return result
    }
    
    func tests() {
        print(findErrorNums([1,2,2,4])) // [2,3]
        print(findErrorNums([1,1])) // [1,2]
    }
}

