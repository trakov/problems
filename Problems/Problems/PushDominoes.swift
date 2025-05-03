final class PushDominoes {
    func pushDominoes(_ dominoes: String) -> String {
        let n = dominoes.count
        var forces = Array(repeating: 0, count: n)
        var force = 0
        for (i, d) in dominoes.enumerated() {
            if d == "R" {
                force = n
            } else if d == "L" {
                force = 0
            } else {
                force = max(force - 1, 0)
            }
            forces[i] += force
        }
        force = 0
        for (i, d) in dominoes.enumerated().reversed() {
            if d == "L" {
                force = n
            } else if d == "R" {
                force = 0
            } else {
                force = max(force - 1, 0)
            }
            forces[i] -= force
        }
        var result: [Character] = Array(repeating: ".", count: n)
        for (i, f) in forces.enumerated() {
            result[i] = f > 0 ? "R" : f < 0 ? "L" : "."
        }
        return String(result)
    }
    
    func tests() {
        print(pushDominoes("RR.L")) // "RR.L"
        print(pushDominoes(".L.R...LR..L..")) // "LL.RR.LLRRLL.."
    }
}
