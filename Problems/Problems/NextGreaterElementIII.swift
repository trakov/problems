class NextGreaterElementIII {
    func nextGreaterElement(_ n: Int) -> Int {
        var digits = Array(String(n))
        let count = digits.count
        guard count > 1 else { return -1 }
        var i = count - 2
        while digits[i + 1] <= digits[i] {
            guard i != 0 else { return -1 }
            i -= 1
        }
        var j = count - 1
        while j >= 0 && digits[j] <= digits[i] {
            j -= 1
        }
        digits.swapAt(i, j)
        i += 1
        j = count - 1
        while i < j {
            digits.swapAt(i, j)
            i += 1
            j -= 1
        }
        guard let result = Int(String(digits)), result <= Int32.max else {
            return -1
        }
        return result
    }
    
    func tests() {
        print(nextGreaterElement(12)) // 21
        print(nextGreaterElement(21)) // -1
    }
}

