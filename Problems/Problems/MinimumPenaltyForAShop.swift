class MinimumPenaltyForAShop {
    func bestClosingTime(_ customers: String) -> Int {
        var penalty = customers.reduce(into: 0) {
            $0 += ($1 == "Y" ? 1 : 0)
        }
        var bestHour = 0
        var curPenalty = penalty
        for (i, c) in customers.enumerated() {
            curPenalty -= (c == "Y" ? 1 : -1)
            if curPenalty < penalty {
                penalty = curPenalty
                bestHour = i + 1
            }
        }
        return bestHour
    }
    
    func tests() {
        print(bestClosingTime("YYNY")) // 2
        print(bestClosingTime("NNNNN")) // 0
        print(bestClosingTime("YYYY")) // 4
    }
}

