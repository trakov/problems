class RemoveColoredPiecesIfBothNeighborsAreTheSameColor {
    func winnerOfGame(_ colors: String) -> Bool {
        var a = 0
        var b = 0
        var i = 0
        var j = 0
        for c in colors {
            if c == "A" {
                i += 1
                j = 0
                if i >= 3 {
                    a += 1
                }
            } else {
                j += 1
                i = 0
                if j >= 3 {
                    b += 1
                }
            }
        }
        return a > b
    }
    
    func tests() {
        print(winnerOfGame("AAABABB")) // true
        print(winnerOfGame("AA")) // false
        print(winnerOfGame("ABBBBBBBAAA")) // false
    }
}

