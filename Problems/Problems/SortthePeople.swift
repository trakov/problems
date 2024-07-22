class SortthePeople {
    func sortPeople(_ names: [String], _ heights: [Int]) -> [String] {
        names.enumerated()
            .sorted {
                heights[$0.offset] > heights[$1.offset]
            }
            .map { $0.1 }
    }
    
    func tests() {
        print(sortPeople(["Mary","John","Emma"], [180,165,170]))
        // ["Mary","Emma","John"]
        print(sortPeople(["Alice","Bob","Bob"], [155,185,150]))
        // ["Bob","Alice","Bob"]
    }
}

