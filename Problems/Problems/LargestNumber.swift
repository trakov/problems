class LargestNumber {
    
    func largestNumber(_ nums: [Int]) -> String {
        let strings = nums.map { String($0) }.sorted { a, b in
            return a + b > b + a
        }
        if strings[0] == "0" { return "0" }
        return strings.joined(separator: "")
    }
    
    func tests() {
        print(largestNumber([34323,3432])) // 343234323
        print(largestNumber([0,9,90,91,10,2])) // 991902100
        print(largestNumber([10,2])) // 210
        print(largestNumber([3,30,34,5,9])) // 9534330
    }
}

