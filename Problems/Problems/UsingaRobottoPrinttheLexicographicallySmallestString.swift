final class UsingaRobottoPrinttheLexicographicallySmallestString {
    func robotWithString(_ s: String) -> String {
        var count: [Character: Int] = [:]
        for c in s {
            count[c, default: 0] += 1
        }
        var stack: [Character] = []
        var result = ""
        var minChar: Character = "a"
        for c in s {
            stack.append(c)
            count[c]! -= 1
            while minChar != "z" && count[minChar] ?? 0 == 0 {
                minChar = Character(UnicodeScalar(Int(minChar.asciiValue!) + 1)!)
            }
            while !stack.isEmpty && stack.last! <= minChar {
                result.append(stack.removeLast())
            }
        }
        return result
    }
    
    func tests() {
        print(robotWithString("zza")) // azz
        print(robotWithString("bac")) // abc
        print(robotWithString("bdda")) // addb
    }
}
