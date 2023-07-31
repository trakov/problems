final class TreeHeight2 {
    func height(v: Vertice) -> Int {
        //    print("V:", v)
        var h = 1
        for c in v.children {
            h = max(h, height(v: c) + 1)
        }
        return h
    }
    
    func printTree(v: Vertice) {
        print("v:", v)
        for c in v.children {
            printTree(v: c)
        }
    }
    
    func createAdjacencyList(from parentsList: [Int]) -> Vertice {
        let parentsSet = Set(parentsList)
        var head: Vertice?
        var temp = [Vertice]()
        for (index, value) in parentsList.enumerated() {
            var p = Vertice(value: value)
            if let ex = (temp.first { $0.value == value }) {
                p = ex
            } else {
                temp.append(p)
            }
            if parentsSet.contains(index) {
                var c = Vertice(value: index)
                //        if value == -1 {
                if let ex = (temp.first { $0.value == index }) {
                    c = ex
                } else {
                    temp.append(c)
                }
                if value == -1 {
                    head = c
                }
                p.add(v: c)
            }
            //        print(p)
        }
        //    print(temp)
        return head!
    }
    
    func processInput(str: String) {
        let input = str.split(separator: "\n")
        guard let count = Int(input.first ?? ""),
              let valuesStr = input.last else {
            fatalError("Bad input")
        }
        let values = (valuesStr.split(separator: " ").compactMap { Int($0) })
        guard values.count == count else {
            fatalError("Count is incorrect: \(values.count) != \(count)")
        }
        let tree = createAdjacencyList(from: values)
        print(height(v: tree) + 1)
    }
    
    func tests() {
        var str = ""
        var isCountSet = false
        while let line = readLine(strippingNewline: false) {
            str.append(line)
            if isCountSet {
                processInput(str: str)
            }
            isCountSet = true
        }
        
        //processInput(str: "10\n9 7 5 5 2 9 9 9 2 -1")

        //let list = [9,7,5,5,2,9,9,9,2,-1]
        //let list = [4,-1,4,1,1]
        //let list = [-1,0,4,0,3]

        //let tree = createAdjacencyList(from: list)
        //printTree(v: tree)
        //print("height: ", height(v: tree))

    }
}
