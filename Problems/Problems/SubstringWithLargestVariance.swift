class SubstringWithLargestVariance {
    func largestVariance(_ s: String) -> Int {
        var counter = Array(repeating: 0, count: 26)
        for c in s {
            counter[Int(c.asciiValue! - Character("a").asciiValue!)] += 1
        }
        var globalMax = 0
        
        for i in 0..<26 {
            for j in 0..<26 {
                // major and minor cannot be the same, and both must appear in s.
                if i == j || counter[i] == 0 || counter[j] == 0 {
                    continue
                }
                
                // Find the maximum variance of major - minor.
                var major = Character(UnicodeScalar(Character("a").asciiValue! + UInt8(i)))
                var minor = Character(UnicodeScalar(Character("a").asciiValue! + UInt8(j)))
                var majorCount = 0
                var minorCount = 0
                
                // The remaining minor in the rest of s.
                var restMinor = counter[j]
                
                for ch in s {
                    if ch == major {
                        majorCount += 1
                    }
                    if ch == minor {
                        minorCount += 1
                        restMinor -= 1
                    }
                    
                    // Only update the variance if there is at least one minor.
                    if minorCount > 0 {
                        globalMax = max(globalMax, majorCount - minorCount)
                    }
                    // We can discard the previous string if there is at least one remaining minor.
                    if majorCount < minorCount && restMinor > 0 {
                        majorCount = 0
                        minorCount = 0
                    }
                }
            }
        }
        
        return globalMax
    }

    func tests() {
        print(largestVariance("aababbb")) // 3
        print(largestVariance("abcde")) // 0
    }
}

