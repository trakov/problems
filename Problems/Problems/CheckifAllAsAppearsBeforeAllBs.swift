final class CheckifAllAsAppearsBeforeAllBs {
    func checkString(_ s: String) -> Bool {
        var hasB = false
        for c in s {
            if c == "a" {
                if hasB { return false }
            } else {
                hasB = true
            }
        }
        return true
    }
    
    func tests() {
        print(checkString("aaabbb")) // true
        print(checkString("abab")) // false
        print(checkString("bbb")) // true
    }
}
