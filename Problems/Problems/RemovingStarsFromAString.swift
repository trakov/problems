class RemovingStarsFromAString {
    func removeStars(_ s: String) -> String {
        var result: [Character] = []
        for c in s {
            if c == "*" {
                result.removeLast()
            } else {
                result.append(c)
            }
        }
        return String(result)
    }
    
    func tests() {
        print(removeStars("leet**cod*e")) // "lecoe"
        print(removeStars("erase*****")) // ""
    }
}

