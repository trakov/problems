final class CreateGridWithExactlyOnePath {
    func createGrid(_ m: Int, _ n: Int) -> [String] {
        var result = Array(repeating: Array(repeating: Character("#"), count: n), count: m)
        result[0] = Array(repeating: ".", count: n)
        for i in stride(from: 1, to: m, by: 1) {
            result[i][n - 1] = "."
        }
        return result.map { String($0) }
    }
    
    func tests() {
        print(createGrid(2, 3)) // ["..#","#.."]
        print(createGrid(3, 3)) // ["..#","#..","##."]
        print(createGrid(1, 4)) // ["...."]
    }
}
