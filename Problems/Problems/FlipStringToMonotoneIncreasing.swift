class FlipStringToMonotoneIncreasing {
    func minFlipsMonoIncr(_ s: String) -> Int {
        var result = 0
        var num = 0
        for c in s {
            if c == "0" {
                result = min(num, result + 1)
            } else {
                num += 1
            }
        }
        return result
    }

    func tests() {
        print(minFlipsMonoIncr("00110")) // 1
        print(minFlipsMonoIncr("010110")) // 2
        print(minFlipsMonoIncr("00011000")) // 2
    }
}
