class SortArraybyIncreasingFrequency {
    func frequencySort(_ nums: [Int]) -> [Int] {
        var map: [Int: Int] = [:]
        for num in nums {
            map[num, default: 0] += 1
        }
        let sortedMap = map.sorted {
            if $0.value == $1.value {
                return $0.key > $1.key
            } else {
                return $0.value < $1.value
            }
        }
        var result = Array(repeating: 0, count: nums.count)
        var i = 0
        for (num, count) in sortedMap {
            for j in i..<(i + count) {
                result[j] = num
            }
            i += count
        }
        return result
    }
    
    func tests() {
        print(frequencySort([1,1,2,2,2,3])) // [3,1,1,2,2,2]
        print(frequencySort([2,3,1,3,2])) // [1,3,3,2,2]
        print(frequencySort([-1,1,-6,4,5,-6,1,4,1])) // [5,-1,4,4,-6,-6,1,1,1]
    }
}

