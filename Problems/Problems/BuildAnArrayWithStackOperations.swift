class BuildAnArrayWithStackOperations {
    func buildArray(_ target: [Int], _ n: Int) -> [String] {
        guard !target.isEmpty else { return [] }
        var result: [String] = []
        var i = 0
        var k = 1
        while k <= target.last! {
            result.append("Push")
            if target[i] != k {
                result.append("Pop")
            } else {
                i += 1
            }
            k += 1
        }
        return result
    }
    
    func tests() {
        print(buildArray([1,3], 3)) // ["Push","Push","Pop","Push"]
        print(buildArray([1,2,3], 3)) // ["Push","Push","Push"]
        print(buildArray([1,2], 4)) // ["Push","Push"]
    }
}

