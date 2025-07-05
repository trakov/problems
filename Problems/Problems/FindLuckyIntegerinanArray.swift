final class FindLuckyIntegerinanArray {
    func findLucky(_ arr: [Int]) -> Int {
        var map: [Int: Int] = [:]
        for num in arr {
            map[num, default: 0] += 1
        }
        var result = -1
        for key in map.keys where key == map[key] {
            result = max(result, key)
        }
        return result
    }
    
    func tests() {
        print(findLucky([2,2,3,4])) // 2
        print(findLucky([1,2,2,3,3,3])) // 3
        print(findLucky([2,2,2,3,3])) // -1
    }
}
