final class TotalCharactersinStringAfterTransformationsI {
    func lengthAfterTransformations(_ s: String, _ t: Int) -> Int {
        let MOD = 1_000_000_007
        var count = Array(repeating: 0, count: 26)
        for c in s {
            count[Int(c.asciiValue! - Character("a").asciiValue!)] += 1
        }
        for round in 0..<t {
            var next = Array(repeating: 0, count: 26)
            next[0] = count[25]
            next[1] = (count[25] + count[0]) % MOD
            for i in 2..<26 {
                next[i] = count[i - 1]
            }
            count = next
        }
        var result = 0
        for c in count {
            result = (result + c) % MOD
        }
        return result
    }
    
    func tests() {
        print(lengthAfterTransformations("abcyy", 2)) // 7
        print(lengthAfterTransformations("azbk", 1)) // 5
    }
}
