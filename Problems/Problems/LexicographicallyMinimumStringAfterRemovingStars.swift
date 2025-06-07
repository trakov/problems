final class LexicographicallyMinimumStringAfterRemovingStars {
    func clearStars(_ s: String) -> String {
        var count: [[Int]] = Array(repeating: [], count: 26)
        var arr = Array(s)
        for i in 0..<s.count {
            if arr[i] != "*" {
                count[Int(arr[i].asciiValue! - Character("a").asciiValue!)].append(i)
            } else {
                for j in 0..<26 {
                    if !count[j].isEmpty {
                        arr[count[j].removeLast()] = "*"
                        break
                    }
                }
            }
        }
        return String(arr.filter { $0 != "*" })
    }
    
    func tests() {
        print(clearStars("aaba*")) // aab
        print(clearStars("abc")) // abc
    }
}
