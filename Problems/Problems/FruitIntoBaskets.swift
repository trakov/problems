class FruitIntoBaskets {
    func totalFruit(_ fruits: [Int]) -> Int {
        var result = 0
        var map: [Int: Int] = [:] // type: lastIndex
        var temp = 0
        for (i, fruit) in fruits.enumerated() {
            if map.count == 2 && map[fruit] == nil {
                let prevFruit = map.min { f1, f2 in
                    f1.value < f2.value
                }!
                map[prevFruit.key] = nil
                temp = i - prevFruit.value - 1
            }
            map[fruit] = i
            temp += 1
            result = max(result, temp)
        }
        
        return result
    }

    func tests() {
        print(totalFruit([1,2,1])) // 3
        print(totalFruit([0,1,2,2])) // 3
        print(totalFruit([1,2,3,2,2])) // 4
    }
}
