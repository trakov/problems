final class NumberofSubstringsWithOnly1s {
    func numSub(_ s: String) -> Int {
        let mod = 1_000_000_007
        var result = 0
        var count = 0
        for c in s + "0" {
            if c == "1" {
                count += 1
            } else {
                result = (result + (count * (count + 1)) / 2) % mod
                count = 0
            }
        }
        return result
    }
    
    func tests() {
        print(numSub("0110111")) // 9
        print(numSub("101")) // 2
        print(numSub("111111")) // 21
    }
}
