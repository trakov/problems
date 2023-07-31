class GoalParserInterpretation {
    func interpret(_ command: String) -> String {
        command
            .replacingOccurrences(of: "()", with: "o")
            .replacingOccurrences(of: "(al)", with: "al")
    }

    func tests() {
        print(interpret("G()(al)")) // "Goal"
        print(interpret("G()()()()(al)")) // "Gooooal"
        print(interpret("(al)G(al)()()G")) // "alGalooG"
    }
}
