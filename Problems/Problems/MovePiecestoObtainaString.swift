class MovePiecestoObtainaString {
    func canChange(_ start: String, _ target: String) -> Bool {
        let s1 = Array(start)
        let s2 = Array(target)
        let n = s1.count
        var (i, j) = (0, 0)
        while i < n || j < n {
            if i < n && s1[i] == "_" { i += 1; continue }
            if j < n && s2[j] == "_" { j += 1; continue }
            if i == n || j == n { return i == j }
            guard s1[i] == s2[j] else { return false }
            if s1[i] == "L" && i < j || s1[i] == "R" && i > j { return false }
            i += 1
            j += 1
        }
        return true
    }
    
    func tests() {
        print(canChange("_L__R__R_", "L______RR")) // true
        print(canChange("R_L_", "__LR")) // false
        print(canChange("_R", "R_")) // false
    }
}

