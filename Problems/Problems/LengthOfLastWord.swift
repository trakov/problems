class LengthOfLastWord {
    func lengthOfLastWord(_ s: String) -> Int {
        s.split(separator: " ").last?.count ?? 0
    }

    func tests() {
        print(lengthOfLastWord("Hello World")) // 5
        print(lengthOfLastWord("   fly me   to   the moon  ")) // 4
    }
}
