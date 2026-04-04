final class DecodetheSlantedCiphertext {
    func decodeCiphertext(_ encodedText: String, _ rows: Int) -> String {
        let cols = encodedText.count / rows
        let encodedText = Array(encodedText)
        var result = ""
        for col in 0..<cols {
            for row in 0..<rows {
                let j = col + row
                guard j < cols else { break }
                let i = cols * row + j
                result.append(encodedText[i])
            }
        }
        while result.last?.isWhitespace == true {
            result.removeLast()
        }
        return result
    }
    
    func tests() {
        print(decodeCiphertext("ch   ie   pr", 3)) // "cipher"
        print(decodeCiphertext("iveo    eed   l te   olc", 4)) // "i love leetcode"
        print(decodeCiphertext("coding", 1)) // "coding"
    }
}
