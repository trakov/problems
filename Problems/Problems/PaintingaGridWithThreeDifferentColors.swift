import Foundation
final class PaintingaGridWithThreeDifferentColors {
    func colorTheGrid(_ m: Int, _ n: Int) -> Int {
        let mod = 1_000_000_007
        var valid: [Int: [Int]] = [:]
        let maskEnd = Int(pow(3, Double(m)))
        for mask in 0..<maskEnd {
            var color: [Int] = []
            var mm = mask
            for i in 0..<m {
                color.append(mm % 3)
                mm /= 3
            }
            var check = true
            for i in 0..<m - 1 {
                if color[i] == color[i + 1] {
                    check = false
                    break
                }
            }
            if check {
                valid[mask] = color
            }
        }
        var adjacent: [Int: [Int]] = [:]
        for mask1 in valid.keys {
            for mask2 in valid.keys {
                var check = true
                for i in 0..<m {
                    if valid[mask1]?[i] == valid[mask2]?[i] {
                        check = false
                        break
                    }
                }
                if check {
                    adjacent[mask1, default: []].append(mask2)
                }
            }
        }
        var f: [Int: Int] = [:]
        for mask in valid.keys {
            f[mask] = 1
        }
        for i in 1..<n {
            var g: [Int: Int] = [:]
            for mask2 in valid.keys {
                for mask1 in adjacent[mask2, default: []] {
                    g[mask2, default: 0] += f[mask1, default: 0] % mod
                }
            }
            f = g
        }
        var result = 0
        for num in f.values {
            result = (result + num) % mod
        }
        return result
    }
    
    func tests() {
        print(colorTheGrid(1, 1)) // 3
        print(colorTheGrid(1, 2)) // 6
        print(colorTheGrid(5, 5)) // 580986
    }
}
