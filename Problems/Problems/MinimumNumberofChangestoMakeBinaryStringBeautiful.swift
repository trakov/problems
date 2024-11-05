class MinimumNumberofChangestoMakeBinaryStringBeautiful {
    func minChanges(_ s: String) -> Int {
        var result = 0
        let s = Array(s)
        for i in 0..<s.count/2 {
            let c = s[2 * i]
            let next = s[2 * i + 1]
            if c != next { result += 1 }
        }
        return result
    }
    
    func tests() {
        print(minChanges("1001")) // 2
        print(minChanges("10")) // 1
        print(minChanges("0000")) // 0
    }
}

