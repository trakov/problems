final class FinalValueofVariableAfterPerformingOperations {
    func finalValueAfterOperations(_ operations: [String]) -> Int {
        operations.reduce(0) { result, op in
            result + (op == "++X" || op == "X++" ? 1 : -1)
        }
    }
    
    func tests() {
        print(finalValueAfterOperations(["--X","X++","X++"])) // 1
        print(finalValueAfterOperations(["++X","++X","X++"])) // 3
        print(finalValueAfterOperations(["X++","++X","--X","X--"])) // 0
    }
}
