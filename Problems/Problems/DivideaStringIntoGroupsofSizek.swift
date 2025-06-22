import Foundation
final class DivideaStringIntoGroupsofSizek {
    func divideString(_ s: String, _ k: Int, _ fill: Character) -> [String] {
        let n = (s.count + k - 1) / k
        var result = Array(repeating: "", count: n)
        for i in 0..<n {
            let str: String
            if i < n - 1 || n * k == s.count {
                str = s.substring(with: .init(NSMakeRange(i * k, k), in: s)!)
            } else {
                str = s.suffix(k - n * k + s.count) + String(repeating: fill, count: n * k - s.count)
            }
            result[i] = str
        }
        return result
    }
    
    func tests() {
        print(divideString("abcdefghi", 3, "x")) // ["abc","def","ghi"]
        print(divideString("abcdefghij", 3, "x")) // ["abc","def","ghi","jxx"]
        print(divideString("ctoyjrwtngqwt", 8, "n")) // ["ctoyjrwt","ngqwtnnn"]
    }
}
