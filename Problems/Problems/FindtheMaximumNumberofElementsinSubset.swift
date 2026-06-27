final class FindtheMaximumNumberofElementsinSubset {
    func maximumLength(_ nums: [Int]) -> Int {
        var count: [Int: Int] = [:]
        for num in nums {
            count[num, default: 0] += 1
        }
        let oneCount = count[1] ?? 0
        var result = (oneCount & 1) == 1 ? oneCount : oneCount - 1
        count[1] = nil
        for num in count.keys {
            var res = 0
            var x = num
            while count[x] ?? 0 > 1 {
                res += 2
                x *= x
            }
            result = max(result, res + (count[x] != nil ? 1 : -1))
        }
        return result
    }
    
    func tests() {
        print(maximumLength([5,4,1,2,2])) // 3
        print(maximumLength([1,3,2,4])) // 1
    }
}
