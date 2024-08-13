class AccountsMerge {
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        var accs: [(String, Set<String>)] = Array(repeating: ("", []), count: accounts.count)
        var nameToIndices: [String: Set<Int>] = [:]

        for (i, acc) in accounts.enumerated() {
            accs[i] = (acc[0], Set(acc[(1..<acc.count)]))
            nameToIndices[acc[0], default: []].insert(i)
        }

        var result: [[String]] = []

        while let (name, emails) = accs.popLast() {
            nameToIndices[name]?.remove(accs.count)
            guard let indices = nameToIndices[name], !indices.isEmpty else {
                result.append([name] + Array(emails.sorted()))
                continue
            }
            var found = false
            for i in indices where !accs[i].1.intersection(emails).isEmpty {
                accs[i].1.formUnion(emails)
                found = true
                break
            }
            if !found {
                result.append([name] + Array(emails.sorted()))
            }
        }

        return result
    }
    
    func tests() {
        print(accountsMerge([
            ["John","johnsmith@mail.com","john_newyork@mail.com"],
            ["John","johnsmith@mail.com","john00@mail.com"],
            ["Mary","mary@mail.com"],
            ["John","johnnybravo@mail.com"]
        ]))
//        [
//            ["John","john00@mail.com","john_newyork@mail.com","johnsmith@mail.com"],
//            ["Mary","mary@mail.com"],
//            ["John","johnnybravo@mail.com"]
//        ]
        print(accountsMerge([
            ["Gabe","Gabe0@m.co","Gabe3@m.co","Gabe1@m.co"],
            ["Kevin","Kevin3@m.co","Kevin5@m.co","Kevin0@m.co"],
            ["Ethan","Ethan5@m.co","Ethan4@m.co","Ethan0@m.co"],
            ["Hanzo","Hanzo3@m.co","Hanzo1@m.co","Hanzo0@m.co"],
            ["Fern","Fern5@m.co","Fern1@m.co","Fern0@m.co"]
        ]))
//        [
//            ["Ethan","Ethan0@m.co","Ethan4@m.co","Ethan5@m.co"],
//            ["Gabe","Gabe0@m.co","Gabe1@m.co","Gabe3@m.co"],
//            ["Hanzo","Hanzo0@m.co","Hanzo1@m.co","Hanzo3@m.co"],
//            ["Kevin","Kevin0@m.co","Kevin3@m.co","Kevin5@m.co"],
//            ["Fern","Fern0@m.co","Fern1@m.co","Fern5@m.co"]
//        ]
    }
}

