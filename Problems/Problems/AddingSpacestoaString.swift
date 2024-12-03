class AddingSpacestoaString {
    func addSpaces(_ s: String, _ spaces: [Int]) -> String {
        var result: [Character] = Array(repeating: " ", count: s.count + spaces.count)
        var j = 0
        for (i, c) in s.enumerated() {
            if j < spaces.count && spaces[j] == i {
                j += 1
            }
            result[i + j] = c
        }
        return String(result)
    }
    
    func tests() {
        print(addSpaces("LeetcodeHelpsMeLearn", [8,13,15])) // "Leetcode Helps Me Learn"
        print(addSpaces("icodeinpython", [1,5,7,9])) // "i code in py thon"
        print(addSpaces("spacing", [0,1,2,3,4,5,6])) // " s p a c i n g"
    }
}

