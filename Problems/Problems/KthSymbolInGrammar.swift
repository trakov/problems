class KthSymbolInGrammar {
    func kthGrammar(_ n: Int, _ k: Int) -> Int {
        let count = String(k - 1, radix: 2).filter { $0 == "1" }.count
        return count % 2 == 0 ? 0 : 1
    }
    
    func tests() {
        print(kthGrammar(1, 1)) // 0
        print(kthGrammar(2, 1)) // 0
        print(kthGrammar(2, 2)) // 1
    }
}

