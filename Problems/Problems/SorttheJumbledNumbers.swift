class SorttheJumbledNumbers {
    func sortJumbled(_ mapping: [Int], _ nums: [Int]) -> [Int] {
        var map: [Int: Int] = [:]
        func mapped(_ num: Int) -> Int {
            if num == 0 { return mapping[0] }
            var num = num
            var res = 0
            var ten = 1
            while num != 0 {
                res += mapping[num % 10] * ten
                num /= 10
                ten *= 10
            }
            return res
        }
        for num in nums where map[num] == nil {
            map[num] = mapped(num)
        }
        return nums.sorted {
            if map[$0] == map[$1] {
                return false
            } else {
                return map[$0]! < map[$1]!
            }
        }
    }
    
    func tests() {
        print(sortJumbled([8,9,4,0,2,1,3,5,7,6], [991,338,38]))//[338,38,991]
        print(sortJumbled([0,1,2,3,4,5,6,7,8,9], [789,456,123]))//[123,456,789]
        print(sortJumbled(
            [9,8,7,6,5,4,3,2,1,0],
            [0,1,2,3,4,5,6,7,8,9]
        )) // [9,8,7,6,5,4,3,2,1,0]
    }
}

