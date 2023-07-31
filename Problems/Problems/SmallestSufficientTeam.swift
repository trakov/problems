class SmallestSufficientTeam {
    func smallestSufficientTeam(_ req_skills: [String], _ people: [[String]]) -> [Int] {
        var dp = [String: [Int]]()

        func dfs(_ skills: Set<String>) -> [Int] {
            let skillKey = skills.sorted().joined(separator: ",")

            if let existingTeam = dp[skillKey] {
                return existingTeam
            }

            var minTeam = [Int]()

            for (index, personSkills) in people.enumerated() {
                let intersection = skills.intersection(personSkills)
                if !intersection.isEmpty {
                    let remainingSkills = skills.subtracting(intersection)
                    let nextTeam = dfs(remainingSkills)
                    if minTeam.isEmpty || nextTeam.count + 1 < minTeam.count {
                        minTeam = [index] + nextTeam
                    }
                }
            }

            dp[skillKey] = minTeam
            return minTeam
        }

        let initialSkills = Set(req_skills)
        return dfs(initialSkills)
    }
    
    func tests() {
        print(smallestSufficientTeam(["java","nodejs","reactjs"], [["java"],["nodejs"],["nodejs","reactjs"]])) // [0,2]
        print(smallestSufficientTeam(["algorithms","math","java","reactjs","csharp","aws"], [["algorithms","math","java"],["algorithms","math","reactjs"],["java","csharp","aws"],["reactjs","csharp"],["csharp","math"],["aws","java"]])) // [1,2]
    }
}

