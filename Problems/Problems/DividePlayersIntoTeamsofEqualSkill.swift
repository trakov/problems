class DividePlayersIntoTeamsofEqualSkill {
    // frequency
    func dividePlayers(_ skill: [Int]) -> Int {
        let n = skill.count
        var freq = Array(repeating: 0, count: 1000 + 1)
        var total = 0
        for s in skill {
            freq[s] += 1
            total += s
        }
        guard total % (n/2) == 0 else { return -1 }
        let targetSkill = total / (n / 2)
        var result = 0
        for s in skill {
            let otherSkill = targetSkill - s
            guard freq[otherSkill] > 0 else { return -1 }
            result += s * otherSkill
            freq[otherSkill] -= 1
        }
        return result / 2
    }

    // sorting
    func dividePlayers2(_ skill: [Int]) -> Int {
        let skill = skill.sorted()
        let n = skill.count
        for i in 0..<(n/2 - 1) {
            guard skill[i] + skill[n-i-1] == skill[i+1] + skill[n-i-2] else {
                return -1
            }
        }
        var result = 0
        for i in 0..<n/2 {
            result += (skill[i] * skill[n-i-1])
        }
        return result
    }
    
    func tests() {
        print(dividePlayers([3,2,5,1,3,4])) // 22
        print(dividePlayers([3,4])) // 12
        print(dividePlayers([1,1,2,3])) // -1
    }
}

