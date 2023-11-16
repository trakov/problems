class FindUniqueBinaryString {
    func findDifferentBinaryString(_ nums: [String]) -> String {
        var result: [Character] = Array(repeating: "0", count: nums.count)
        for (i, num) in nums.enumerated() {
            result[i] = num[num.index(num.startIndex, offsetBy: i)] == "0" ? "1" : "0"
        }
        return String(result)
    }
    
    func tests() {
        print(findDifferentBinaryString(["01","10"])) // 11
        print(findDifferentBinaryString(["00","01"])) // 11
        print(findDifferentBinaryString(["111","011","001"])) // 101
    }
}

