class DeleteColumnsToMakeSorted {
    func minDeletionSize(_ strs: [String]) -> Int {
        guard strs.count > 1 else { return 0 }
        let strs: [[Character]] = strs.map { return Array($0) }
        var count = 0
        for j in 0..<strs[0].count {
            var prev = strs[0][j]
            for i in 1..<strs.count {
                if strs[i][j] >= prev {
                    prev = strs[i][j]
                } else {
                    count += 1
                    break
                }
            }
        }
        
        return count
    }

    func tests() {
        print(minDeletionSize(["cba","daf","ghi"])) // 1
        print(minDeletionSize(["a","b"])) // 0
        print(minDeletionSize(["zyx","wvu","tsr"])) // 3
    }
}
