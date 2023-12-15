class DestinationCity {
    func destCity(_ paths: [[String]]) -> String {
        var origins: Set<String> = []
        var dests: Set<String> = []
        for path in paths {
            origins.insert(path[0])
            dests.insert(path[1])
        }
        return dests.subtracting(origins).first!
    }
    
    func tests() {
        print(destCity([["London","New York"],["New York","Lima"],["Lima","Sao Paulo"]]))
        // "Sao Paulo"
        print(destCity([["B","C"],["D","B"],["C","A"]])) // A
        print(destCity([["A","Z"]])) // Z
    }
}

