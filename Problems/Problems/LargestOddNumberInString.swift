class LargestOddNumberInString {
    func largestOddNumber(_ num: String) -> String {
        guard let lastIndex = num.lastIndex(
            where: { Int(String($0))! % 2 != 0 }
        ) else { return "" }
        return String(num[num.startIndex...lastIndex])
    }
    
    func tests() {
        print(largestOddNumber("52")) // 5
        print(largestOddNumber("4206")) // ""
        print(largestOddNumber("35427")) // 35427
    }
}

