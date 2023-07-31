class Dota2Senate {
    func predictPartyVictory(_ senate: String) -> String {
        var senate = Array(senate)
        var dCount = 0
        var rCount = 0
        for s in senate {
            if s == "D" { dCount += 1 }
            else { rCount += 1 }
        }
        var i = 0
        var banDCount = 0
        var banRCount = 0
        while rCount > 0 && dCount > 0 {
            if senate[i] == "R" {
                if banRCount == 0 {
                    banDCount += 1
                } else {
                    senate[i] = "-"
                    banRCount -= 1
                    rCount -= 1
                }
            } else if senate[i] == "D" {
                if banDCount == 0 {
                    banRCount += 1
                } else {
                    senate[i] = "-"
                    banDCount -= 1
                    dCount -= 1
                }
            }
            i = (i + 1) % senate.count
        }
        
        return rCount > 0 ? "Radiant" : "Dire"
    }
    
    func tests() {
        print(predictPartyVictory("RD")) // Radiant
        print(predictPartyVictory("RDD")) // Dire
        print(predictPartyVictory("DRRDRDRDRDDRDRDR")) // R
        print(predictPartyVictory("DDRRR")) // D
    }
}

