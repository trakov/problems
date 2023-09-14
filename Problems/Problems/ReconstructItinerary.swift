class ReconstructItinerary {
    func findItinerary(_ tickets: [[String]]) -> [String] {
        guard !tickets.isEmpty else { return [] }
        let sorted = tickets.sorted { $0[1] < $1[1] }
        var graph: [String: [String]] = [:]
        for ticket in sorted {
            let from = ticket[0]
            let to = ticket[1]
            graph[from, default: []].append(to)
        }
        var result: [String] = []

        func dfs(_ from: String) {
            while !(graph[from]?.isEmpty ?? true) {
                dfs(graph[from]!.removeFirst())
            }
            result.append(from)
        }

        dfs("JFK")
        return result.reversed()
    }

    func tests() {
        print(findItinerary([["MUC","LHR"],["JFK","MUC"],["SFO","SJC"],["LHR","SFO"]]))
        // ["JFK","MUC","LHR","SFO","SJC"]
        
        print(findItinerary([["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]]))
        // ["JFK","ATL","JFK","SFO","ATL","SFO"]
    }
}

