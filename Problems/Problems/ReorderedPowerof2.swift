final class ReorderedPowerof2 {
    func reorderedPowerOf2(_ n: Int) -> Bool {
        var all: Set<[Character]> = []
        let nSorted = String(n).sorted()
        var i = 1
        while i <= Int(String(nSorted.reversed()))! {
            all.insert(String(i).sorted())
            i *= 2
        }
        return all.contains(nSorted)
    }

    func tests() {
        print(reorderedPowerOf2(1)) // true
        print(reorderedPowerOf2(10)) // false
        print(reorderedPowerOf2(46)) // true
    }
}
