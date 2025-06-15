final class MaxDifferenceYouCanGetFromChanginganInteger {
    func maxDiff(_ num: Int) -> Int {
        var minNum = Array(String(num))
        var maxNum = minNum
        let n = maxNum.count
        func replace(_ s: inout [Character], _ x: Character, _ y: Character) {
            for i in 0..<n {
                if s[i] == x {
                    s[i] = y
                }
            }
        }
        for i in 0..<n {
            let digit = maxNum[i]
            if digit != "9" {
                replace(&maxNum, digit, "9")
                break
            }
        }
        for i in 0..<n {
            let digit = minNum[i]
            if i == 0 {
                if digit != "1" {
                    replace(&minNum, digit, "1")
                    break
                }
            } else {
                if digit != "0" && digit != minNum.first {
                    replace(&minNum, digit, "0")
                    break
                }
            }
        }
        return Int(String(maxNum))! - Int(String(minNum))!
    }

    func tests() {
        print(maxDiff(555)) // 888
        print(maxDiff(9)) // 8
    }
}
