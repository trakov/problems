final class PyramidTransitionMatrix {
    var baseToTopDict: [Substring: [Substring]] = [:]
    var cache: [Substring: Bool] = [:]
    
    func pyramidTransition(_ bottom: String, _ allowed: [String]) -> Bool {
        for allow in allowed {
            let base = allow.prefix(2)
            let top = allow.suffix(1)
            baseToTopDict[base, default: []].append(top)
        }
        return pyramidTransitionHelper(Substring(bottom))
    }
    
    private func pyramidTransitionHelper(_ bottom: Substring) -> Bool {
        if let value = cache[bottom] { return value }
        if bottom.count == 1 { return true }
        var topListStrings: [[Substring]] = []
        for i in 0..<bottom.count - 1 {
            let startIndex = bottom.index(bottom.startIndex, offsetBy: i)
            let endIndex = bottom.index(bottom.startIndex, offsetBy: i+1)
            let base = bottom[startIndex...endIndex]
            guard let topList = baseToTopDict[base] else {
                cache[base] = false
                return false
            }
            topListStrings.append(topList)
        }
        var result: [Substring] = []
        func nextTopPossibleStrings(_ index: Int, _ temp: Substring) {
            if index == topListStrings.count {
                result.append(temp)
                return
            }
            let currentList = topListStrings[index]
            for current in currentList {
                nextTopPossibleStrings(index + 1, temp + current)
            }
        }
        nextTopPossibleStrings(0, "")
        for topLevel in result {
            if pyramidTransitionHelper(topLevel) {
                cache[topLevel] = true
                return true
            }
        }
        cache[bottom] = false
        return false
    }
    
    func tests() {
        print(pyramidTransition("BCD", ["BCC","CDE","CEA","FFF"])) // true
        print(pyramidTransition("AAAA", ["AAB","AAC","BCD","BBE","DEF"])) // false
    }
}
