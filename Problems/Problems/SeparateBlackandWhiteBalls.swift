class SeparateBlackandWhiteBalls {
    func minimumSteps(_ s: String) -> Int {
        var left = 0
        var result = 0
        for (right, c) in s.enumerated() where c == "0" {
            result += right - left
            left += 1
        }
        return result
    }

    func minimumSteps2(_ s: String) -> Int {
        let s = Array(s)
        let n = s.count
        var left = 0
        var right = n - 1
        var result = 0
        while left < right {
            if s[left] == "0" {
                left += 1
            } else if s[right] == "1" {
                right -= 1
            } else {
                result += right - left
                left += 1
                right -= 1
            }
        }
        return result
    }
    
    func tests() {
        print(minimumSteps("101")) // 1
        print(minimumSteps("100")) // 2
        print(minimumSteps("0111")) // 0
    }
}

