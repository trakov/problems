final class MaximumNumberofOperationstoMoveOnestotheEnd {
    func maxOperations(_ s: String) -> Int {
        guard s.count > 1 else { return 0 }
        let s = Array(s)
        var result = 0
        var oneCount = 0
        for (i, c) in s.enumerated() {
            if c == "1" {
                if i > 0 && s[i - 1] == "0" {
                    result += oneCount
                }
                oneCount += 1
            } else if i == s.count - 1 {
                result += oneCount
            }
        }
        return result
    }
    
    func tests() {
        print(maxOperations("1001101")) // 4
        print(maxOperations("00111")) // 0
    }
}
