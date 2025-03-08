class MinimumRecolorstoGetKConsecutiveBlackBlocks {
    func minimumRecolors(_ blocks: String, _ k: Int) -> Int {
        let blocks = Array(blocks)
        var left = 0
        var numWhites = 0
        var result = Int.max
        for (right, val) in blocks.enumerated() {
            if val == "W" {
                numWhites += 1
            }
            if right - left + 1 == k {
                result = min(result, numWhites)
                if blocks[left] == "W" { numWhites -= 1 }
                left += 1
            }
        }
        return result
    }
    
    func tests() {
        print(minimumRecolors("WBBWWBBWBW", 7)) // 3
        print(minimumRecolors("WBWBBBW", 2)) // 0
    }
}

