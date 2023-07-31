class MinimumGeneticMutation {
    func minMutation(_ startGene: String, _ endGene: String, _ bank: [String]) -> Int {
        guard startGene != endGene else { return 0 }
        var bank = Set(bank)
        guard bank.contains(endGene) else { return -1 }
        var count = 1
        var queue = [startGene]
        
        func mutations(of g: String) -> [String] {
            var result: [String] = []
            for (i, c) in g.enumerated() {
                let muts = ["A", "C", "G", "T"].filter { $0 != c }
                for mut in muts {
                    result.append(g.prefix(i)+String(mut)+g.dropFirst(i+1))
                }
            }
            return result
        }
        
        while !queue.isEmpty {
            var nextQueue: [String] = []
            for gene in queue {
                for mut in mutations(of: gene) {
                    if bank.contains(mut) {
                        if mut == endGene { return count }
                        nextQueue.append(mut)
                        bank.remove(mut)
                    }
                }
            }
            count += 1
            queue = nextQueue
        }
        
        return -1
    }
    
    func tests() {
        print(minMutation("AACCGGTT", "AACCGGTA", ["AACCGGTA"])) // 1
        print(minMutation("AACCGGTT", "AAACGGTA", ["AACCGGTA","AACCGCTA","AAACGGTA"])) // 2
    }
}

